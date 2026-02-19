local h = require("tests.helpers")

local hex = function(n)
  if n then
    return string.format("#%06x", n)
  end
end

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
                    colors = {
                        dark_red = "require('onedarkpro.helpers').darken('red', 10, 'onedark')",
                        light_blue = "require('onedarkpro.helpers').lighten('blue', 10, 'onelight')",
                        bright_green = "require('onedarkpro.helpers').brighten('green', 10, 'onedark')",
                        basic_red = "require('onedarkpro.helpers').darken('#FF0000', 5)",
                    },
                    highlights = {
                        DarkHighlight = {
                            fg = "${dark_red}",
                        },
                        LightHighlight = {
                            fg = "${light_blue}",
                        },
                        BrightHighlight = {
                            fg = "${bright_green}",
                        },
                        BasicRedHighlight = {
                            fg = "${basic_red}",
                        },
                    },
                    filetypes = {
                        all = false,
                    },
                    plugins = {
                        all = false,
                    },
                })
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

T["Using the theme's helpers"] = new_set()

T["Using the theme's helpers"]["it should DARKEN colors from a theme"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "DarkHighlight" })]])
  eq("#d7424d", hex(output.fg))
end

T["Using the theme's helpers"]["it should DARKEN hex colors"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "BasicRedHighlight" })]])
  eq("#e60000", hex(output.fg))
end

T["Using the theme's helpers"]["it should LIGHTEN colors"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "LightHighlight" })]])
  eq("#1caceb", hex(output.fg))
end

T["Using the theme's helpers"]["it should BRIGHTEN colors"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "BrightHighlight" })]])
  eq("#acdd89", hex(output.fg))
end

T["Using the theme's helpers"]["it should retrieve a single color"] = function()
  local color = child.lua_get([[require("onedarkpro.helpers").get_color("purple")]])
  eq("#c678dd", color)
end

return T
