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
        local output = vim.api.nvim_get_hl(0, { name = "DarkHighlight" })
        assert.equals("#d7424d", hex(output.fg))
    end)
    it("it should DARKEN hex colors", function()
        local output = vim.api.nvim_get_hl(0, { name = "BasicRedHighlight" })
        assert.equals("#e60000", hex(output.fg))
    end)

    it("it should LIGHTEN colors", function()
        local output = vim.api.nvim_get_hl(0, { name = "LightHighlight" })
        assert.equals("#1caceb", hex(output.fg))
    end)

    it("it should BRIGHTEN colors", function()
        local output = vim.api.nvim_get_hl(0, { name = "BrightHighlight" })
        assert.equals("#acdd89", hex(output.fg))
    end)

    it("it should retrieve a single color", function()
        local color = require("onedarkpro.helpers").get_color("purple")
        assert.equals("#c678dd", color)
    end)
end)
