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
                    styles = {
                        variables = "bold"
                    },
                    options = {
                        terminal_colors = true,
                        cursorline = true,
                        highlight_inactive_windows = true,
                    },
                    filetypes = {
                        all = false,
                        javascript = true,
                    },
                    plugins = {
                        all = false,
                        op_nvim = true,
                        treesitter = true,
                    },
                    colors = {
                        onedark_vivid = {
                            red = "#e06c75", -- Overwrite red to onedark's red
                            oli_color = "#ff00ff",
                            diff_add = "#ff0000"
                        },
                        onelight = {
                            oli_color = "#f0f0f0",
                        }
                    },
                    highlights = {
                        Cursor = {},
                        Constant = {
                            fg = "${blue}",
                            blend = 100,
                        },
                        Directory = {
                            style = "bold",
                        },
                        ["@keyword"] = {
                            fg = "${purple}"
                        },
                        Repeat = {
                            fg = "${blue}"
                        },
                        Statement = {
                            fg = "${oli_color}"
                        },
                        TestHighlightGroup = {
                            fg = "${red}",
                            style = "italic"
                        },
                        NamespacedHighlightGroup = { ns_id = 23, fg = "${red}" },
                        TestHighlightGroup2 = { link = "Statement" },
                        ConditionalByBackground = { fg = { dark = "#FF0000", light = "#FFFFFF" } },
                        ConditionalByBackgroundByVariable = { bg = { dark = "${red}", light = "${blue}" } },
                        ConditionalByTheme = { bg = { onedark_vivid = "${red}", onelight = "${blue}" } },
                        TestHighlightGroup3 = {
                        reverse = true,
                        },
                        Title = {
                        underline = true,
                        extend = true
                        }
                    },
                })
                vim.cmd("colorscheme onedark_vivid")
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

T["Using the theme"] = new_set()

T["Using the theme"]["it should apply overwritten colors"] = function()
  local content = child.lua_get([[vim.fn.getline(1, "$")]])
  eq("Hello World", content[1])
end

T["Using the theme"]["it should set a global variable"] = function()
  local colors_name = child.lua_get([[vim.g.colors_name]])
  eq("onedark_vivid", colors_name)
end

T["Using the theme"]["it should apply the theme's color palette"] = function()
  local output = child.lua_get([[vim.api.nvim_exec("hi Normal", true)]])
  eq("Normal         xxx guifg=#abb2bf guibg=#282c34", output)
end

T["Using the theme"]["it should apply styles"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "Identifier" })]])
  eq(true, output.bold)
end

T["Using the theme"]["it should be able to create blends"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "Constant" })]])
  eq(hex(output.blend), "#000064")
end

T["Using the theme"]["it should create new colors"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "Statement" })]])
  eq("#ff00ff", hex(output.fg))
end

T["Using the theme"]["it should be able to overwrite existing colors"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "Label" })]])
  eq("#d55fde", hex(output.fg))
end

T["Using the theme"]["it should be able to overwrite generated colors"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "DiffAdd" })]])
  eq("#ff0000", hex(output.bg))
end

T["Using the theme"]["it should apply styles via custom highlights"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "Directory" })]])
  eq(true, output.bold)
end

T["Using the theme"]["it should apply styles via custom highlights (italic)"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })]])
  eq(true, output.italic)
end

T["Using the theme"]["it should apply reverse via custom highlights"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "TestHighlightGroup3" })]])
  eq(true, output.reverse)
end

T["Using the theme"]["it should be able to extend highlights and apply styles"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "Title" })]])
  eq(true, output.underline)
  eq("#89ca78", hex(output.fg))
end

T["Using the theme"]["it should be able to overwrite existing hlgroups"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "@keyword" })]])
  eq("#d55fde", hex(output.fg))
  eq(nil, output.link)
end

T["Using the theme"]["it should be able to create custom hlgroups"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })]])
  eq("#e06c75", hex(output.fg))
end

T["Using the theme"]["it should be able to link to other highlight groups"] = function()
  local output = child.lua_get([[vim.api.nvim_exec("hi TestHighlightGroup2", true)]])
  eq("TestHighlightGroup2 xxx links to Statement", output)
end

-- OTHERS ---------------------------------------------------------------------

T["Using the theme"]["it should apply conditional highlights by background"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "ConditionalByBackground" })]])
  eq(hex(output.fg), "#ff0000")

  child.lua([[vim.cmd("colorscheme onelight")]])

  output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "ConditionalByBackground" })]])
  eq("#ffffff", hex(output.fg))
end

T["Using the theme"]["it should apply conditional highlights by background using variables"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "ConditionalByBackgroundByVariable" })]])
  -- Remember we've overwritten red!
  eq("#e06c75", hex(output.bg))

  child.lua([[vim.cmd("colorscheme onelight")]])

  output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "ConditionalByBackgroundByVariable" })]])
  eq("#118dc3", hex(output.bg))
end

T["Using the theme"]["it should be able to use a theme as a conditional with variables"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "ConditionalByTheme" })]])
  eq("#e06c75", hex(output.bg))

  child.lua([[vim.cmd("colorscheme onelight")]])

  output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "ConditionalByTheme" })]])
  eq("#118dc3", hex(output.bg))
end

T["Using the theme"]["it should be able to load plugins that we have enabled"] = function()
  local output = child.lua_get([[pcall(vim.api.nvim_exec, "hi OpSidebarHeader", true)]])
  eq(true, output)

  output = child.lua_get([[pcall(vim.api.nvim_exec, "hi AerialClass", true)]])
  eq(false, output)
end

T["Using the theme"]["it should be able to load filetypes that we have enabled"] = function()
  local output = child.lua_get([[pcall(vim.api.nvim_exec, "hi @variable.javascript", true)]])
  eq(true, output)

  output = child.lua_get([[pcall(vim.api.nvim_exec, "hi @function.ruby", true)]])
  eq(false, output)
end

T["Using the theme"]["it should allow a color palette to be extracted"] = function()
  local colors = child.lua_get([[require("onedarkpro.helpers").get_colors(vim.g.colors_name)]])
  eq("#d55fde", colors.purple)
  eq("onedark_vivid", colors.name)
end

T["Using the theme"]["it should set terminal colors if the option is enabled"] = function()
  local terminal_color = child.lua_get([[vim.g.terminal_color_0]])
  eq("#282c34", terminal_color)
end

T["Using the theme"]["it should apply options"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "CursorLine" })]])
  eq("#2e333c", hex(output.bg))
end

T["Using the theme"]["it should not apply options that are false"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "VertSplit" })]])
  eq("#282c34", hex(output.bg))
end

T["Using the theme"]["it changes the theme when the background changes"] = function()
  local colors_name = child.lua_get([[vim.g.colors_name]])
  eq("onedark_vivid", colors_name)

  child.lua([[vim.cmd("colorscheme onelight")]])

  colors_name = child.lua_get([[vim.g.colors_name]])
  eq("onelight", colors_name)
end

T["Using the theme"]["it changes colors and highlight groups when the background changes"] = function()
  local output = child.lua_get([[vim.api.nvim_exec("hi Normal", true)]])
  eq("Normal         xxx guifg=#abb2bf guibg=#282c34", output)

  child.lua([[vim.cmd("colorscheme onelight")]])

  output = child.lua_get([[vim.api.nvim_exec("hi Normal", true)]])
  eq("Normal         xxx guifg=#6a6a6a guibg=#fafafa", output)
end

T["Using the theme"]["it changes custom highlight groups when the background changes"] = function()
  local output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })]])
  eq("#e06c75", hex(output.fg))

  child.lua([[vim.cmd("colorscheme onelight")]])

  output = child.lua_get([[vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })]])
  eq("#e05661", hex(output.fg))
end

T["Using the theme"]["it allows for highlight groups to be unset"] = function()
  local is_empty = child.lua_get([[next(vim.api.nvim_get_hl(0, { name = "Cursor" })) == nil]])
  eq(true, is_empty)
end

T["Using the theme"]["it creates the autocmds for inactive windows"] = function()
  local has_onedarkpro =
    child.lua_get([[string.find(vim.api.nvim_exec("autocmd Onedarkpro", true), "Onedarkpro") ~= nil]])
  local has_winenter = child.lua_get([[string.find(vim.api.nvim_exec("autocmd Onedarkpro", true), "WinEnter") ~= nil]])
  local has_winleave = child.lua_get([[string.find(vim.api.nvim_exec("autocmd Onedarkpro", true), "WinLeave") ~= nil]])
  local has_winhighlight =
    child.lua_get([[string.find(vim.api.nvim_exec("autocmd Onedarkpro", true), "set winhighlight") ~= nil]])

  eq(true, has_onedarkpro)
  eq(true, has_winenter)
  eq(true, has_winleave)
  eq(true, has_winhighlight)
end

T["Using the theme"]["it namespaces highlight groups"] = function()
  local first_key = child.lua_get([[next(vim.api.nvim_get_hl(23, { name = "NamespacedHighlightGroup" }))]])
  eq("fg", first_key)
end

-- Test set for background loading
T["loading respects vim.o.background"] = new_set({
  hooks = {
    pre_case = function()
      h.child_start(child)
      child.lua([[
                vim.o.background = "dark"
                vim.cmd.colorscheme("default")
                require("onedarkpro").setup()
            ]])
    end,
    post_once = child.stop,
  },
})

T["loading respects vim.o.background"]["= dark"] = function()
  child.lua([[
        vim.cmd.colorscheme("onedark")
    ]])

  local bg = child.lua_get([[vim.o.background]])
  local colors_name = child.lua_get([[vim.g.colors_name]])

  eq("dark", bg)
  eq("onedark", colors_name)
end

T["loading respects vim.o.background"]["= light"] = function()
  child.lua([[
        vim.o.background = "light"
        vim.cmd.colorscheme("onelight")
    ]])

  local bg = child.lua_get([[vim.o.background]])
  local colors_name = child.lua_get([[vim.g.colors_name]])

  eq("light", bg)
  eq("onelight", colors_name)
end

T["loading respects vim.o.background"]["= dark with onelight"] = function()
  child.lua([[
        vim.cmd.colorscheme("onelight")
    ]])

  local bg = child.lua_get([[vim.o.background]])
  local colors_name = child.lua_get([[vim.g.colors_name]])

  eq("dark", bg)
  eq("onelight", colors_name)
end

return T
