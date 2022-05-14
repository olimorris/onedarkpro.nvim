local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    dark_theme = "some_made_up_theme", -- The default dark theme
})
onedarkpro.load()

describe("Override default theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("sets the theme", function()
        assert.equals(vim.g.onedarkpro_style, "onedark")
    end)
end)
