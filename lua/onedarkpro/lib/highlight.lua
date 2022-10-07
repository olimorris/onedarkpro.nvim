local M = {}
local fmt = string.format

---Validate the value from the opts table
---@param input string
---@return string
local function validate(input)
    return input and input or "NONE"
end

---Validate the link from the opts table
---@param link string
---@return boolean
local function valid_link(link)
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
        table.insert(values, fmt([[%s = %s%s%s]], k, q, v, q))
    end

    table.sort(values)
    return fmt([[{ %s }]], table.concat(values, ", "))
end

---Create highlights the new Neovim way
---@param highlights table the highlights that should be created
---@param ns_id? integer the namespace id
---@param cached_output? table the table where the highlights should be output to
---@return table|nil
function M.neovim_hl(highlights, ns_id, cached_output)
    ns_id = ns_id or 0

    for name, opts in pairs(highlights) do
        if valid_link(opts.link) then
            if type(cached_output) == "table" then
                table.insert(cached_output, fmt([[vim.api.nvim_set_hl(0, "%s", { link = "%s" })]], name, opts.link))
            else
                vim.api.nvim_set_hl(0, name, {
                    link = opts.link,
                })
            end
        else
            local values = parse_style(opts.style)
            values.fg = opts.fg
            values.bg = opts.bg
            values.sp = opts.sp
            values.blend = opts.blend

            if type(cached_output) == "table" then
                table.insert(cached_output, fmt([[vim.api.nvim_set_hl(0, "%s", %s)]], name, expand_values(values)))
            else
                vim.api.nvim_set_hl(ns_id, name, values)
            end
        end
    end

    if type(cached_output) == "table" then
        return cached_output
    end
end

---Create highlights the old school vim way
---@param highlights table
---@param cached_output? table the table where the highlights should be output to
---@return table|nil
function M.vim_hl(highlights, cached_output)
    for name, opts in pairs(highlights) do
        if valid_link(opts.link) then
            local link_output = fmt("highlight! link %s %s", name, opts.link)

            if type(cached_output) == "table" then
                table.insert(cached_output, "vim.cmd(\"" .. link_output .. "\")")
            else
                vim.cmd(link_output)
            end
        else
            local group_output = fmt(
                "highlight %s guifg=%s guibg=%s gui=%s guisp=%s blend=%s",
                name,
                validate(opts.fg),
                validate(opts.bg),
                validate(opts.style),
                validate(opts.sp),
                validate(opts.blend)
            )

            if type(cached_output) == "table" then
                table.insert(cached_output, "vim.cmd(\"" .. group_output .. "\")")
            else
                vim.cmd(group_output)
            end
        end
    end

    if type(cached_output) == "table" then
        return cached_output
    end
end

---Create highlight groups
---@param highlights table
---@param output? table (optional) table to output to
---@return table|nil
function M.create(highlights, output)
    local utils = require("onedarkpro.utils")

    if utils.use_nvim_api then
        return M.neovim_hl(highlights, 0, output)
    end

    return M.vim_hl(highlights, output)
end

return M
