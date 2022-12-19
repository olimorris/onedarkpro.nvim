local util = require("onedarkpro.lib.color")

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
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
        local colors = require("onedarkpro").get_colors("onedark")

        assert.equals("#67bbff", Color.from_hex(colors.blue):brighter(10):to_css())
    end)

    it("with the new color API, it should LIGHTEN colors", function()
        local Color = require("onedarkpro.lib.color")
        local colors = require("onedarkpro").get_colors("onedark")
        local red = Color.from_hex(colors.red)

        assert.equals("#e9969d", red:lighter(10):to_css())
    end)

    it("with the new color API, it should DARKEN colors", function()
        local Color = require("onedarkpro.lib.color")
        local colors = require("onedarkpro").get_colors("onedark")
        local red = Color.from_hex(colors.red)

        assert.equals("#d7424d", red:darker(10):to_css())
    end)
end)
