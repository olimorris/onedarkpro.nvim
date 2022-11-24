local utils = require("onedarkpro.utils")
local config = require("onedarkpro.config")

local M = {}

---Validate the input value
---@param input string
---@return string
local function validate(input)
    return input and input or "NONE"
end

---Validate the link from the opts table
---@param link string
---@return boolean
local function should_link(link)
    return link and link ~= ""
end

---Parse a comma separated styles string into a table
---For example: "bold,italic" -> {bold = true, italic = true}"
---@param style string
---@return table
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

---Expand the highlight group's values into a string from a table
---@param tbl table of values
---@return string
local function expand_values(tbl)
    local values = {}
    for k, v in pairs(tbl) do
        local q = type(v) == "string" and [["]] or ""
        table.insert(values, string.format([[%s = %s%s%s]], k, q, v, q))
    end

    table.sort(values)
    return string.format([[{ %s }]], table.concat(values, ", "))
end

---Form highlights using the Neovim API
---@param name string the highlight group name
---@param values table the highlight group values
---@return string
local function neovim_highlights(name, values)
    if should_link(values.link) then
        return string.format([[vim.api.nvim_set_hl(0, "%s", { link = "%s" })]], name, values.link)
    end

    local val = parse_style(values.style)
    val.bg = values.bg
    val.fg = values.fg
    val.sp = values.sp
    val.blend = values.blend

    return string.format([[vim.api.nvim_set_hl(0, "%s", %s)]], name, expand_values(val))
end

local function vim_highlights(name, values)
    if should_link(values.link) then
        return string.format("highlight! link %s %s", name, values.link)
    end

    return string.format(
        "highlight %s guifg=%s guibg=%s gui=%s guisp=%s blend=%s",
        name,
        validate(values.fg),
        validate(values.bg),
        validate(values.style),
        validate(values.sp),
        validate(values.blend)
    )
end

---Compile the colorscheme
---@param opts table
---@return function
function M.compile(opts)
    opts = opts or {}
    local theme = require("onedarkpro.theme").load(opts.theme or config.theme)
    local groups = require("onedarkpro.highlight").groups(theme)

    -- https://www.gammon.com.au/scripts/doc.php?lua=string.dump
    local lines = {
        string.format(
            [[
require("onedarkpro").compiled = string.dump(function()
if vim.g.colors_name then vim.cmd("hi clear") end
vim.o.termguicolors = true
vim.g.colors_name = "%s"
vim.o.background = "%s"
    ]],
            theme.meta.name,
            theme.meta.background
        ),
    }

    --TODO: Add in terminal colors

    for name, values in pairs(groups) do
        if utils.has_nvim_07 then
            table.insert(lines, neovim_highlights(name, values))
        else
            table.insert(lines, vim_highlights(name, values))
        end
    end

    --TODO: Add in window unfocused autocmds

    table.insert(lines, [[end)]])

    -- https://www.lua.org/pil/8.html
    local ld = load or loadstring
    return ld(table.concat(lines, "\n"), "=")()
end

return M
