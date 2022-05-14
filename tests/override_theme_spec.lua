local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    dark_theme = "onedark_vivid", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    colors = {onedark_vivid = {bg = '#27292d'}}
})
onedarkpro.load()

describe("Override default theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("sets the theme", function()
        assert.equals(vim.g.onedarkpro_style, "onedark_vivid")
    end)
end)
