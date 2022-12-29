--TODO: Remove this on 2023-01-20
local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using OLD CONFIG options in the theme", function()
    before_each(function()
        vim.o.background = "dark"
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("it should be able to load colors correctly", function()
        local colors = require("onedarkpro").get_colors()
        assert.equals("#282c34", string.lower(colors.bg))
    end)

    it("it should have the correct theme set", function()
        local theme = require("onedarkpro.config").theme
        assert.equals("onedark_vivid", theme)
    end)
end)
