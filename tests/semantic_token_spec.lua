local util = require("plenary.async.util")
local async = require("plenary.async.tests")

local hex = function(n)
    if n then return string.format("#%06x", n) end
end

async.describe("Semantic tokens", function()
    async.before_each(function()
        vim.cmd(":e tests/stubs/test.lua")
    end)

    after_each(function()
        require("onedarkpro").clean()
    end)

    async.it("are applied", function()
        util.scheduler()
        -- require('pl.pretty').dump(vim.inspect_pos(0, 6, 1))
        require('pl.pretty').dump(vim.lsp.buf_get_clients(0))

        local output = vim.api.nvim_get_hl_by_name("@global", true)
        assert.equals("#e06c75", hex(output.foreground))
    end)

    async.it("can be overwritten", function()
        local output = vim.api.nvim_get_hl_by_name("@class", true)
        assert.equals("#ff00ff", hex(output.background))
    end)

    async.it("can be created", function()
        local output = vim.api.nvim_get_hl_by_name("@declaration", true)
        assert.equals("#ff00ff", hex(output.background))
    end)
end)
