local config = require("onedarkpro.config")

local M = {}

---Parse a comma separated styles or table values into a table
---For example: "bold,italic" or "{ bold = true, italic = true }"
---will yield: "{bold = true, italic = true}"
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
        -- Strip out the namespace key
        if k ~= "ns_id" then table.insert(values, string.format([[%s = %s%s%s]], k, q, v, q)) end
    end

    table.sort(values)
    return string.format([[{ %s }]], table.concat(values, ", "))
end

---Resolve a color in a highlight group by the theme background or name
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

---Create highlight groups using the Neovim API
---@param name string the highlight group name
---@param values table the highlight group values
---@param theme table the theme
---@param opts? table
---@return string
local function highlight(name, values, theme, opts)
    if values.link then return string.format([[set_hl(0, "%s", { link = "%s" })]], name, values.link) end
    if next(values) == nil then return string.format([[set_hl(%s, "%s", {})]], values.ns_id or 0, name) end

    local val = parse_style(values)
    val.bg = resolve_value(values.bg, theme)
    val.fg = resolve_value(values.fg, theme)

    if opts and opts.custom and opts.extend then
        val.extend = nil
        return string.format(
            [[set_hl(%s, "%s", vim.tbl_extend("force", get_hl(0, { name = "%s" }), %s))]],
            values.ns_id or 0,
            name,
            name,
            expand_values(val)
        )
    end

    return string.format([[set_hl(%s, "%s", %s)]], values.ns_id or 0, name, expand_values(val))
end

---Compile the theme
---@param theme string
---@param opts? table
---@return function|string
function M.compile(theme, opts)
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

if vim.g.colors_name then vim.cmd("hi clear") end

vim.o.termguicolors = true
vim.g.colors_name = "%s"
vim.o.background = "%s"]],
            theme.meta.name,
            theme.meta.background
        ),
    }

    -- Terminal colors
    table.insert(lines, "\n-- Terminal colors\n")
    if config.options.terminal_colors then
        local terminal_colours = require("onedarkpro.highlights.terminal").groups(theme)
        for name, value in pairs(terminal_colours) do
            table.insert(lines, string.format([[vim.g.%s = "%s"]], name, value))
        end
    end

    -- Highlight groups
    table.insert(lines, "\n-- Highlight groups\n")
    for name, values in pairs(highlight_groups) do
        table.insert(lines, highlight(name, values, theme))
    end

    -- Custom highlight groups
    table.insert(lines, "\n-- Custom highlight groups\n")
    if type(custom_groups) == "table" and not vim.tbl_isempty(custom_groups) then
        for name, values in pairs(custom_groups) do
            table.insert(lines, highlight(name, values, theme, { custom = true, extend = values.extend }))
        end
    end

    -- Autocmds
    if config.options.highlight_inactive_windows or config.options.window_unfocused_color then
        table.insert(lines, "\n-- Autocmds\n")
        local autocmds = require("onedarkpro.highlights.autocmd").groups(theme)
        for _, values in pairs(autocmds) do
            table.insert(lines, values)
        end
    end

    -- End the function
    table.insert(lines, [[end)]])

    if opts and opts.debug then return table.concat(lines, "\n") end

    --Compile lua with the load function. The use of assert ensures that errors
    --in the compilation process bubble up to be handled later in the plugin
    --(source: https://www.lua.org/pil/8.html)
    local ld = load or loadstring
    return assert(ld(table.concat(lines, "\n"), "="))()
end

return M
