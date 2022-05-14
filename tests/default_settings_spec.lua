local onedarkpro = require("onedarkpro")
onedarkpro.setup()
onedarkpro.load()

describe("Default settings", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
    end)

    it("loads a file with the default settings", function()
        local content = vim.fn.getline(1, "$")
        assert.equals(content[1], "Test is working")
    end)
end)
