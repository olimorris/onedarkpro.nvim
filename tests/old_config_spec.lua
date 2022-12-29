--TODO: DEPRECATE THIS
local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using OLD CONFIG options in the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("it should be able to load colors correctly", function()
        local colors = require("onedarkpro").get_colors()
        assert.equals("#fafafa", string.lower(colors.bg))
    end)

    it("it should have the correct theme set", function()
        local theme = require("onedarkpro.config").theme
        assert.equals("onelight", theme)
    end)
end)
