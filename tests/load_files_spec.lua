local hex = function(n)
    if n then
        return string.format("#%06x", n)
    end
end

local utils = require("onedarkpro.utils")

describe("With the Ruby filetype disabled", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.rb")
    end)

    it("it should not apply highlights", function()
        local output = vim.api.nvim_get_hl_by_name("@label.ruby", true)
        -- Purple instead of red
        assert.equals("#c678dd", hex(output.foreground))
    end)

    it("it should not apply highlights", function()
        local output = vim.api.nvim_get_hl_by_name("@punctuation.bracket.ruby", true)
        -- Fg instead of yellow
        assert.equals("#abb2bf", hex(output.foreground))
    end)
end)
