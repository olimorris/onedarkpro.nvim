local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Semantic tokens", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.lua")
    end)

    after_each(function()
        require("onedarkpro").clean()
    end)

    it("are applied", function()
        local output = vim.api.nvim_get_hl_by_name("@global", true)
        assert.equals("#e06c75", hex(output.foreground))
    end)

    it("can be overwritten", function()
        local output = vim.api.nvim_get_hl_by_name("@class", true)
        assert.equals("#ff00ff", hex(output.background))
    end)

    it("can be created", function()
        local output = vim.api.nvim_get_hl_by_name("@declaration", true)
        assert.equals("#ff00ff", hex(output.background))
    end)
end)
