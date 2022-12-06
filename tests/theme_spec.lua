local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)
    after_each(function()
        require("onedarkpro").clean()
    end)

    it("it should be able to have variables in the color config table", function()
        local output = vim.api.nvim_get_hl_by_name("IlluminatedWordText", true)
        assert.equals("#db77e3", string.lower(hex(output.background)))
    end)

    it("it should add custom variables to the get_colors method", function()
        local colors = require("onedarkpro").get_colors()
        assert.equals("#db77e3", string.lower(colors.medium_purple))
    end)
end)
