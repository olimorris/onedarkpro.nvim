describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("Neovim should open with no errors", function()
        local content = vim.fn.getline(1, "$")
        assert.equals("Hello World", content[1])
    end)

    it("it should set a global variable", function()
        assert.equals("onedark", vim.g.onedarkpro_style)
    end)
end)
