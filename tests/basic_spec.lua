describe("Using the colorscheme without calling setup,", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("there should be no errors", function()
        local content = vim.fn.getline(1, "$")
        assert.equals("Hello World", content[1])
    end)

    it("it should apply the theme's color palette", function()
        local output = vim.api.nvim_exec("hi ErrorMsg", true)
        assert.equals("ErrorMsg       xxx guifg=#e06c75", output)
    end)

    it("a global variable should be set", function()
        assert.equals("onedark", vim.g.onedarkpro_theme)
    end)
end)
