local util = require("onedarkpro.lib.color")

local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    after_each(function()
        -- This is essential to make sure that config changes are properly applied
        require("onedarkpro").clean()
    end)

    it("it should be able to DARKEN colors", function()
        local dark_red = util.darken("#ff0000", 0.5)
        assert.equals("#800000", string.lower(dark_red))
    end)

    it("it should be able to LIGHTEN colors", function()
        local light_red = util.lighten("#ff0000", 0.5)
        assert.equals("#ff8080", string.lower(light_red))
    end)

    it("with the new color API, it should BRIGHTEN colors", function()
        local Color = require("onedarkpro.lib.color")
        local colors = require("onedarkpro.helpers").get_colors("onedark")

        assert.equals("#67bbff", Color.from_hex(colors.blue):brighter(10):to_css())
    end)

    it("with the new color API, it should LIGHTEN colors", function()
        local Color = require("onedarkpro.lib.color")
        local colors = require("onedarkpro.helpers").get_colors("onedark")
        local red = Color.from_hex(colors.red)

        assert.equals("#e9969d", red:lighter(10):to_css())
    end)

    it("with the new color API, it should DARKEN colors", function()
        local Color = require("onedarkpro.lib.color")
        local colors = require("onedarkpro.helpers").get_colors("onedark")
        local red = Color.from_hex(colors.red)

        assert.equals("#d7424d", red:darker(10):to_css())
    end)

    it("color overrides which are not a color, should be executed as a function", function()
        local output = vim.api.nvim_get_hl_by_name("Repeat", true)
        assert.equals("#df6871", hex(output.foreground))
    end)
end)
