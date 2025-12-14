local h = require("tests.helpers")

local eq = MiniTest.expect.equality --[[@type function]]

local new_set = MiniTest.new_set

local child = MiniTest.new_child_neovim()
T = new_set({
    hooks = {
        pre_case = function()
            h.child_start(child)
            child.lua([[
                local onedarkpro = require("onedarkpro")
                onedarkpro.setup({
                    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test/"),
                    plugins = {
                        all = false,
                        treesitter = true,
                    },
                })
                vim.cmd("colorscheme onedark")
                vim.cmd(":e tests/stubs/test.lua")
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

T["When in a Lua file"] = new_set()

T["When in a Lua file"]["it should source without error"] = function()
    child.lua([[vim.cmd("so %")]])
    local content = child.lua_get([[vim.fn.getline(1, "$")]])
    eq("-- Some comment", content[1])
end

return T
