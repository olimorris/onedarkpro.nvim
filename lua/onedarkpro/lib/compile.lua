local config = require("onedarkpro.config")

local M = {}

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
    if not style or style == "NONE" then return {} end

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
local function highlight(name, values)
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

---Compile the colorscheme
---@param opts table
---@return function
function M.compile(opts)
    opts = opts or {}
    local theme = require("onedarkpro.theme").load(opts.theme or config.theme)
    local highlight_groups = require("onedarkpro.highlight").groups(theme)

    --Encase the colorscheme's logic in a function which can then be executed with
    --the string.dump function, converting it into a binary representation
    --(source: https://www.gammon.com.au/scripts/doc.php?lua=string.dump)
    --The binary is then assigned to a compiled property which can be used
    --for caching to disk later on in the theme's lifecycle
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

    -- Terminal colors
    if config.config.options.terminal_colors then
        local terminal_colours = require("onedarkpro.highlights.terminal").groups(theme)
        for name, value in pairs(terminal_colours) do
            table.insert(lines, string.format([[vim.g.%s = "%s"]], name, value))
        end
    end

    -- Colorscheme highlight groups
    for name, values in pairs(highlight_groups) do
        table.insert(lines, highlight(name, values))
    end

    --TODO: Add in window unfocused autocmds

    table.insert(lines, [[end)]])

    --Use load (or loadstring) to compile the lua code but don't execute it
    --The use of assert ensures that errors in the compiled code bubble up
    --(source: https://www.lua.org/pil/8.html)
    local ld = load or loadstring
    return assert(ld(table.concat(lines, "\n"), "="))()
end

return M
