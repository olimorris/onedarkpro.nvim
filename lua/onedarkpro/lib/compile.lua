local config = require("onedarkpro.config")

local M = {}

---Parse a comma separated styles string into a table
---For example: "bold,italic" -> {bold = true, italic = true}"
---@param tbl table
---@return table
local function parse_style(tbl)
    if not tbl.style then
        return tbl
    elseif tbl.style == "NONE" then
        tbl.style = nil
        return tbl
    end

    for token in string.gmatch(tbl.style, "([^,]+)") do
        tbl[token] = true
    end

    tbl.style = nil

    return tbl
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

--- Resolve a highlight group's value from a table
---@param value table|string highlight group values
---@param theme table the theme
---@return table|string|nil
local function resolve_value(value, theme)
    if type(value) == "table" then
        if value[theme.meta.background] then return value[theme.meta.background] end
        if value[theme.meta.name] then return value[theme.meta.name] end
        return
    end

    return value
end

---Form highlights using the Neovim API
---@param name string the highlight group name
---@param values table the highlight group values
---@param theme table the theme
---@return string
local function highlight(name, values, theme)
    if values.link then return string.format([[set_hl(0, "%s", { link = "%s" })]], name, values.link) end

    local val = parse_style(values)
    val.bg = resolve_value(values.bg, theme)
    val.fg = resolve_value(values.fg, theme)
    val.sp = values.sp
    val.blend = values.blend

    return string.format([[set_hl(0, "%s", %s)]], name, expand_values(val))
end

local function custom_highlight(name, values, theme)
    if values.link then return string.format([[set_hl(0, "%s", { link = "%s" })]], name, values.link) end

    values = parse_style(values)
    values.bg = resolve_value(values.bg, theme)
    values.fg = resolve_value(values.fg, theme)

    local highlight_group = string.format([[custom_group = get_hl(0, { name = "%s", link = false })]], name)
    local extends_values =
        string.format([[custom_group_val = vim.tbl_extend("force", custom_group, %s)]], expand_values(values))

    return string.format([[%s; %s; set_hl(0, "%s", custom_group_val)]], highlight_group, extends_values, name)
end

---Compile the colorscheme
---@param theme string
---@return function
function M.compile(theme)
    theme = require("onedarkpro.theme").load(theme or config.theme)
    local highlight_groups, custom_groups = require("onedarkpro.highlight").groups(theme)

    --Encase the colorscheme's logic in a function which can be executed with a
    --string.dump function call. In turn this converts it into a binary form
    --(source: https://www.gammon.com.au/scripts/doc.php?lua=string.dump)
    local lines = {
        string.format(
            [[
return string.dump(function()
local set_hl = vim.api.nvim_set_hl
local get_hl = vim.api.nvim_get_hl
local custom_group = {}
local custom_group_val = {}
if vim.g.colors_name then vim.cmd("hi clear") end
vim.o.termguicolors = true
vim.g.colors_name = "%s"
vim.o.background = "%s"
    ]],
            theme.meta.name,
            theme.meta.background
        ),
    }

    -- Terminal colors
    if config.config.options.terminal_colors then
        local terminal_colours = require("onedarkpro.highlights.terminal").groups(theme)
        for name, value in pairs(terminal_colours) do
            table.insert(lines, string.format([[vim.g.%s = "%s"]], name, value))
        end
    end

    -- Highlight groups
    for name, values in pairs(highlight_groups) do
        table.insert(lines, highlight(name, values, theme))
    end

    -- User Highlight groups
    if type(custom_groups) == "table" and not vim.tbl_isempty(custom_groups) then
        for name, values in pairs(custom_groups) do
            table.insert(lines, custom_highlight(name, values, theme))
        end
    end

    -- Autocmds
    if config.config.options.highlight_inactive_windows or config.config.options.window_unfocused_color then
        local autocmds = require("onedarkpro.highlights.autocmd").groups(theme)
        for _, values in pairs(autocmds) do
            table.insert(lines, values)
        end
    end

    -- End the function
    table.insert(lines, [[end)]])

    --Compile lua with the load function. The use of assert ensures that errors
    --in the compilation process bubble up to be handled later in the plugin
    --(source: https://www.lua.org/pil/8.html)
    local ld = load or loadstring
    return assert(ld(table.concat(lines, "\n"), "="))()
end

return M
