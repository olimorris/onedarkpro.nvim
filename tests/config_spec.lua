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

    it("it should create new colors", function()
        local output = vim.api.nvim_get_hl_by_name("Statement", true)
        assert.equals("#ff00ff", hex(output.foreground))
    end)

    it("it should apply styles", function()
        local output = vim.api.nvim_get_hl_by_name("Identifier", true)
        assert.equals(true, output.bold)
    end)

    if util.has_nvim_08 then
        it("it should apply options", function()
            local output = vim.api.nvim_get_hl_by_name("CursorLine", true)
            assert.equals("#2e323a", hex(output.background))
        end)

        it("it should not apply options that are false", function()
            local output = vim.api.nvim_get_hl_by_name("VertSplit", true)
            assert.equals("#282c34", hex(output.background))
        end)
    end

    it("it should be able to overwrite existing colors", function()
        local output = vim.api.nvim_get_hl_by_name("Label", true)
        assert.equals("#d55fde", hex(output.foreground))
    end)

    it("it should be able to overwrite generated colors", function()
        local output = vim.api.nvim_get_hl_by_name("DiffAdd", true)
        assert.equals("#ff0000", hex(output.background))
    end)

    it("it should be able to overwrite existing hlgroups", function()
        local output = vim.api.nvim_get_hl_by_name("Repeat", true)
        assert.equals("#61afef", hex(output.foreground))
    end)

    it("it should be able to create custom hlgroups", function()
        local output = vim.api.nvim_get_hl_by_name("TestHighlightGroup", true)
        assert.equals("#e06c75", hex(output.foreground))
    end)

    it("it should be able to link to other highlight groups", function()
        local output = vim.api.nvim_exec("hi TestHighlightGroup2", true)
        assert.equals("TestHighlightGroup2 xxx links to Statement", output)
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
        local colors = require("onedarkpro").get_colors(vim.g.colors_name)
        assert.equals("#d55fde", colors.purple)
        assert.equals("onedark_vivid", colors.name)
    end)

    it("it should set terminal colors if the option is enabled", function()
        assert.equals(vim.g.terminal_color_0, "#282c34")
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
        local output = vim.api.nvim_get_hl_by_name("TestHighlightGroup", true)
        assert.equals("#e06c75", hex(output.foreground))

        vim.cmd([[colorscheme onelight]])
        output = vim.api.nvim_get_hl_by_name("TestHighlightGroup", true)
        assert.equals("#e05661", hex(output.foreground))
    end)

    it("it creates the autocmds for inactive windows", function()
        local output = vim.api.nvim_exec("autocmd Onedarkpro", true)

        assert.equals(true, string.find(output, "Onedarkpro") ~= nil)
        assert.equals(true, string.find(output, "WinEnter") ~= nil)
        assert.equals(true, string.find(output, "WinLeave") ~= nil)
        assert.equals(true, string.find(output, "set winhighlight") ~= nil)
    end)
end)
