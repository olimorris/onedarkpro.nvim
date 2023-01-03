local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
        vim.o.background = "dark"
    end)

    after_each(function()
        -- This is essential to make sure that config changes are properly applied
        require("onedarkpro").clean()
    end)

    it("it should link highlight groups together", function()
        local output = vim.api.nvim_get_hl_by_name("NormalFloat", true)
        assert.equals("#abb2bf", hex(output.foreground))
        assert.equals("#333841", hex(output.background))
    end)
end)
