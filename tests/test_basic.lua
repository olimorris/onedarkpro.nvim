local h = require("tests.helpers")

local eq = MiniTest.expect.equality
local new_set = MiniTest.new_set

local child = MiniTest.new_child_neovim()
T = new_set({
  hooks = {
    pre_case = function()
      h.child_start(child)
      child.lua([[
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

T["basic"] = new_set()

T["basic"]["there should be no errors"] = function()
  local content = child.lua_get([[vim.fn.getline(1, "$")]])
  eq("Hello World", content[1])
end

T["basic"]["it should apply the theme's color palette"] = function()
  local output = child.lua_get([[vim.api.nvim_exec("hi ErrorMsg", true)]])
  eq("ErrorMsg       xxx guifg=#e06c75", output)
end

T["basic"]["it should set a global variable"] = function()
  local colors_name = child.lua_get([[vim.g.colors_name]])
  eq("onedark", colors_name)
end

T["basic"]["it should be able to get the theme's colors"] = function()
  local colors = child.lua_get([[require("onedarkpro.helpers").get_colors()]])
  eq("#c678dd", colors.purple)
end

T["basic"]["it should be able to load plugins"] = function()
  local output = child.lua_get([[vim.api.nvim_exec("hi OpSidebarHeader ", true)]])
  eq("OpSidebarHeader xxx guifg=#abb2bf", output)
end

T["basic"]["it should be able to load filetypes"] = function()
  local output = child.lua_get([[vim.api.nvim_exec("hi @variable.javascript", true)]])
  eq("@variable.javascript xxx guifg=#e06c75", output)
end

return T
