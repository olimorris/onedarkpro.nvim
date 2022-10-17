local hex = function(n)
    if n then
        return string.format("#%06x", n)
    end
end

local function parse_style(style)
    if not style or style == "NONE" then
        return {}
    end

    local result = {}
    for token in string.gmatch(style, "([^,]+)") do
        result[token] = true
    end

    return result
end

local function filetype()
    return vim.bo.filetype
end

local function set_filetype(ft)
    while filetype() ~= ft do
        vim.cmd("bn")
    end
end

local util = require("plenary.async.util")
local async = require("plenary.async.tests")

async.describe("Using the theme", function()
    async.before_each(function()
        vim.cmd(":e tests/stubs/test.rb")
        vim.cmd(":e tests/stubs/test.lua")
        vim.cmd(":e tests/stubs/test.py")
        vim.o.background = "dark"
    end)

    async.it("in a Ruby file, highlights should be applied", function()
        set_filetype("ruby")
        util.scheduler()

        assert.equals(filetype(), "ruby")

        local output = vim.api.nvim_get_hl_by_name("Function", true)
        assert.equals(hex(output.background), "#98c379")

        local output = vim.api.nvim_get_hl_by_name("Comment", true)
        assert.equals(hex(output.background), "#98c379")
    end)

    async.it("in a Lua file, highlights should be applied", function()
        set_filetype("lua")
        util.scheduler()

        assert.equals(filetype(), "lua")

        local output = vim.api.nvim_get_hl_by_name("Function", true)
        assert.equals(hex(output.background), "#c678dd")

        local output = vim.api.nvim_get_hl_by_name("Comment", true)
        assert.equals(hex(output.background), "#c678dd")
    end)

    async.it("in a Python file, the default highlights should be restored", function()
        set_filetype("python")
        util.scheduler()

        assert.equals(filetype(), "python")

        local output = vim.api.nvim_get_hl_by_name("Function", true)
        assert.equals(hex(output.foreground), "#61afef")

        local output = vim.api.nvim_get_hl_by_name("Comment", true)
        assert.equals(hex(output.foreground), "#7f848e")
    end)
end)
