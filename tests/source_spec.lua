describe("When in a Lua file", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.lua")
    end)

    after_each(function()
        -- This is essential to make sure that config changes are properly applied
        require("onedarkpro").clean()
    end)

    it("it should source without error", function()
        vim.cmd([[so %]])
        local content = vim.fn.getline(1, "$")
        assert.equals("-- Some comment", content[1])
    end)
end)
