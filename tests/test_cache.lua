local h = require("tests.helpers")

local eq, neq = MiniTest.expect.equality, MiniTest.expect.no_equality
local new_set = MiniTest.new_set

local child = MiniTest.new_child_neovim()
T = new_set({
  hooks = {
    pre_case = function()
      h.child_start(child)
      child.lua([[
                local onedarkpro = require("onedarkpro")
                onedarkpro.setup({
                    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test"),
                })

                local util = require("onedarkpro.utils")
                local cache_path = require("onedarkpro.config").cache_path

                -- Create timestamp hashes to compare to
                vim.g.onedarkpro_hash = util.hash(util.join_paths(cache_path, "cache"))
                vim.g.onedark_compiled = util.hash(util.join_paths(cache_path, "onedark_compiled"))
                vim.g.onelight_compiled = util.hash(util.join_paths(cache_path, "onelight_compiled"))

                vim.cmd("colorscheme onedark")
                vim.cmd(":e tests/stubs/test.txt")
            ]])
    end,
    post_case = function()
      child.lua([[
                require("onedarkpro").clean()
            ]])
    end,
    post_once = child.stop,
  },
})

T["Cache"] = new_set()
T["Cache"]["Using the theme"] = new_set()

T["Cache"]["Using the theme"]["it SHOULD NOT regenerate a hash if it doesn't need to"] = function()
  local onedarkpro_hash = child.lua_get([[vim.g.onedarkpro_hash]])
  local current_hash = child.lua([[
        local util = require("onedarkpro.utils")
        local cache_path = require("onedarkpro.config").cache_path
        return util.hash(util.join_paths(cache_path, "cache"))
    ]])
  eq(onedarkpro_hash, current_hash)
end

T["Cache"]["Using the theme"]["it SHOULD NOT regenerate colorschemes if it doesn't need to"] = function()
  local onedark_compiled = child.lua_get([[vim.g.onedark_compiled]])
  local current_onedark = child.lua([[
        local util = require("onedarkpro.utils")
        local cache_path = require("onedarkpro.config").cache_path
        return util.hash(util.join_paths(cache_path, "onedark_compiled"))
    ]])
  eq(onedark_compiled, current_onedark)

  local onelight_compiled = child.lua_get([[vim.g.onelight_compiled]])
  local current_onelight = child.lua([[
        local util = require("onedarkpro.utils")
        local cache_path = require("onedarkpro.config").cache_path
        return util.hash(util.join_paths(cache_path, "onelight_compiled"))
    ]])
  eq(onelight_compiled, current_onelight)
end

T["Cache"]["Using the cache"] = new_set({
  hooks = {
    pre_case = function()
      child.lua([[
            require("onedarkpro").clean()

            tbl = {
                colors = {},
                highlights = {},
                filetypes = {
                    vue = true,
                    javascript = true,
                    lua = true,
                    python = true,
                    ruby = true,
                    markdown = true,
                    typescriptreact = true,
                    rust = true,
                    toml = true,
                    php = true,
                    typescript = true,
                    yaml = true,
                },
            }
            _G.hash = require("onedarkpro.lib.hash").hash(tbl)
        ]])
    end,
  },
})

T["Cache"]["Using the cache"]["the SAME table should always return the SAME hash"] = function()
  eq(-215055643, child.lua_get([[_G.hash]]))
end

T["Cache"]["Using the cache"]["a MODIFIED table should return a DIFFERENT hash"] = function()
  child.lua([[
        tbl.colors = {
            red = "#ff0000",
        }
        _G.new_hash = require("onedarkpro.lib.hash").hash(tbl)
    ]])
  local original_hash = child.lua_get([[_G.hash]])
  local new_hash = child.lua_get([[_G.new_hash]])

  neq(original_hash, new_hash)
end

return T
