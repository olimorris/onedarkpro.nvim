local hex = function(n)
    if n then return string.format("#%06x", n) end
end

local util = require("onedarkpro.utils")

describe("Using the theme", function()
    before_each(function()
        -- Ensure that when we've switched to the light theme, we turn it back to dark
        vim.cmd([[colorscheme onedark_vivid]])
        vim.cmd(":e tests/stubs/test.txt")
    end)

    after_each(function()
        -- This is essential to make sure that config changes are properly applied
        require("onedarkpro").clean()
    end)

    it("Neovim should open with no errors", function()
        local content = vim.fn.getline(1, "$")
        assert.equals("Hello World", content[1])
    end)

    it("it should set a global variable", function()
        assert.equals("onedark_vivid", vim.g.colors_name)
    end)

    it("it should apply the theme's color palette", function()
        local output = vim.api.nvim_exec("hi Normal", true)
        assert.equals("Normal         xxx guifg=#abb2bf guibg=#282c34", output)
    end)

    it("it should apply styles", function()
        local output = vim.api.nvim_get_hl(0, { name = "Identifier" })
        assert.equals(true, output.bold)
    end)

    it("it should be able to create blends", function()
        local output = vim.api.nvim_get_hl(0, { name = "Constant" })
        assert.equals(hex(output.blend), "#000064")
    end)

    -- Overwrite colors

    it("it should create new colors", function()
        local output = vim.api.nvim_get_hl(0, { name = "Statement" })
        assert.equals("#ff00ff", hex(output.fg))
    end)

    it("it should be able to overwrite existing colors", function()
        local output = vim.api.nvim_get_hl(0, { name = "Label" })
        assert.equals("#d55fde", hex(output.fg))
    end)

    it("it should be able to overwrite generated colors", function()
        local output = vim.api.nvim_get_hl(0, { name = "DiffAdd" })
        assert.equals("#ff0000", hex(output.bg))
    end)

    -- Custom highlights

    it("it should apply styles via custom highlights", function()
        local output = vim.api.nvim_get_hl(0, { name = "Directory" })
        assert.equals(true, output.bold)
    end)

    it("it should apply styles via custom highlights", function()
        local output = vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })
        assert.equals(true, output.italic)
    end)

    it("it should apply reverse via custom highlights", function()
        local output = vim.api.nvim_get_hl(0, { name = "TestHighlightGroup3" })
        assert.equals(true, output.reverse)
    end)

    it("it should be able to extend highlights and apply styles", function()
        local output = vim.api.nvim_get_hl(0, { name = "Title" })

        assert.equals(true, output.underline)
        assert.equals("#89ca78", hex(output.fg))
    end)

    it("it should be able to overwrite existing hlgroups", function()
        local output = vim.api.nvim_get_hl(0, { name = "@keyword" })
        assert.equals("#d55fde", hex(output.fg))
        assert.equals(nil, output.link)
    end)

    it("it should be able to create custom hlgroups", function()
        local output = vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })
        assert.equals("#e06c75", hex(output.fg))
    end)

    it("it should be able to link to other highlight groups", function()
        local output = vim.api.nvim_exec("hi TestHighlightGroup2", true)
        assert.equals("TestHighlightGroup2 xxx links to Statement", output)
    end)

    -- Others

    it("it should be able to use bg color as a conditional", function()
        local output = vim.api.nvim_get_hl(0, { name = "ConditionalByBackground" })
        assert.equals(hex(output.fg), "#ff0000")

        vim.cmd([[colorscheme onelight]])

        output = vim.api.nvim_get_hl(0, { name = "ConditionalByBackground" })
        assert.equals(hex(output.fg), "#ffffff")
    end)

    it("it should be able to use bg color as a conditional with variables", function()
        local output = vim.api.nvim_get_hl(0, { name = "ConditionalByBackgroundByVariable" })
        -- Remember we've overwritten red!
        assert.equals(hex(output.bg), "#e06c75")

        vim.cmd([[colorscheme onelight]])

        output = vim.api.nvim_get_hl(0, { name = "ConditionalByBackgroundByVariable" })
        assert.equals(hex(output.bg), "#118dc3")
    end)

    it("it should be able to use a theme as a conditional with variables", function()
        local output = vim.api.nvim_get_hl(0, { name = "ConditionalByTheme" })
        -- Remember we've overwritten red!
        assert.equals(hex(output.bg), "#e06c75")

        vim.cmd([[colorscheme onelight]])

        output = vim.api.nvim_get_hl(0, { name = "ConditionalByTheme" })
        assert.equals(hex(output.bg), "#118dc3")
    end)

    it("it should be able to load plugins that we have enabled", function()
        local output = pcall(vim.api.nvim_exec, "hi OpSidebarHeader", true)
        assert.equals(true, output)

        output = pcall(vim.api.nvim_exec, "hi AerialClass", true)
        assert.equals(false, output)
    end)

    it("it should be able to load filetypes that we have enabled", function()
        local output = pcall(vim.api.nvim_exec, "hi @variable.javascript", true)
        assert.equals(true, output)

        output = pcall(vim.api.nvim_exec, "hi @function.ruby", true)
        assert.equals(false, output)
    end)

    it("it should allow a color palette to be extracted", function()
        local colors = require("onedarkpro.helpers").get_colors(vim.g.colors_name)
        assert.equals("#d55fde", colors.purple)
        assert.equals("onedark_vivid", colors.name)
    end)

    it("it should set terminal colors if the option is enabled", function()
        assert.equals(vim.g.terminal_color_0, "#282c34")
    end)

    it("it should apply options", function()
        local output = vim.api.nvim_get_hl(0, { name = "CursorLine" })
        assert.equals("#2e333c", hex(output.bg))
    end)

    it("it should not apply options that are false", function()
        local output = vim.api.nvim_get_hl(0, { name = "VertSplit" })
        assert.equals("#282c34", hex(output.bg))
    end)

    it("it changes the theme when the background changes", function()
        assert.equals("onedark_vivid", vim.g.colors_name)

        vim.cmd([[colorscheme onelight]])
        assert.equals("onelight", vim.g.colors_name)
    end)

    it("it changes colors and highlight groups when the background changes", function()
        local output = vim.api.nvim_exec("hi Normal", true)
        assert.equals("Normal         xxx guifg=#abb2bf guibg=#282c34", output)

        vim.cmd([[colorscheme onelight]])
        output = vim.api.nvim_exec("hi Normal", true)
        assert.equals("Normal         xxx guifg=#6a6a6a guibg=#fafafa", output)
    end)

    it("it changes custom highlight groups when the background changes", function()
        local output = vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })
        assert.equals("#e06c75", hex(output.fg))

        vim.cmd([[colorscheme onelight]])
        output = vim.api.nvim_get_hl(0, { name = "TestHighlightGroup" })
        assert.equals("#e05661", hex(output.fg))
    end)

    it("allows for highlight groups to be unset", function()
        local output = vim.api.nvim_get_hl(0, { name = "Cursor" })
        assert.equals(nil, next(output))
    end)

    it("it creates the autocmds for inactive windows", function()
        local output = vim.api.nvim_exec("autocmd Onedarkpro", true)

        assert.equals(true, string.find(output, "Onedarkpro") ~= nil)
        assert.equals(true, string.find(output, "WinEnter") ~= nil)
        assert.equals(true, string.find(output, "WinLeave") ~= nil)
        assert.equals(true, string.find(output, "set winhighlight") ~= nil)
    end)
end)
