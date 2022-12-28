local util = require("onedarkpro.lib.color")

local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using the theme's helpers", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    after_each(function()
        -- This is essential to make sure that config changes are properly applied
        require("onedarkpro").clean()
    end)

    it("it should DARKEN colors from a theme", function()
        local output = vim.api.nvim_get_hl_by_name("DarkHighlight", true)
        assert.equals("#d7424d", hex(output.foreground))
    end)
    it("it should DARKEN hex colors", function()
        local output = vim.api.nvim_get_hl_by_name("BasicRedHighlight", true)
        assert.equals("#e60000", hex(output.foreground))
    end)

    it("it should LIGHTEN colors", function()
        local output = vim.api.nvim_get_hl_by_name("LightHighlight", true)
        assert.equals("#1caceb", hex(output.foreground))
    end)

    it("it should BRIGHTEN colors", function()
        local output = vim.api.nvim_get_hl_by_name("BrightHighlight", true)
        assert.equals("#acdd89", hex(output.foreground))
    end)
end)
