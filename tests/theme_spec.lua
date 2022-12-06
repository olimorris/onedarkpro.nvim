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
        local color = require("onedarkpro.lib.color")
        local output = vim.api.nvim_get_hl_by_name("IlluminatedWordText", true)
        assert.equals("#db77e3", hex(output.background))
    end)

    -- it("it should add custom variables to the get_colors method", function()
    --     local colors = require("onedarkpro").get_colors()
    --     assert.equals("#484C52", colors.medium_gray)
    -- end)
end)
