local logger = require("onedarkpro.utils.logging")

local M = {}

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
        table.insert(values, string.format([[%s = %s%s%s]], k, q, v, q))
    end

    table.sort(values)
    return string.format([[{ %s }]], table.concat(values, ", "))
end

---Create highlights the new Neovim way
---@param highlights table the highlights that should be created
function M.neovim_hl(highlights)
    for name, opts in pairs(highlights) do
        if valid_link(opts.link) then
            vim.api.nvim_set_hl(0, name, {
                link = opts.link,
            })
        else
            local values = parse_style(opts.style)
            values.fg = opts.fg
            values.bg = opts.bg
            values.sp = opts.sp
            values.blend = opts.blend

            local ok = pcall(vim.api.nvim_set_hl, 0, name, values)
            if not ok then
                vim.notify("[OneDarkPro.nvim] Error setting the '" .. name .. "' highlight group", vim.log.levels.WARN)
                logger.debug("HIGHLIGHTS: Could not set " .. name)
            end
        end
    end
end

---Create highlights the old school vim way
---@param highlights table
function M.vim_hl(highlights)
    for name, opts in pairs(highlights) do
        if valid_link(opts.link) then
            local link_output = string.format("highlight! link %s %s", name, opts.link)
            vim.cmd(link_output)
        else
            local group_output = string.format(
                "highlight %s guifg=%s guibg=%s gui=%s guisp=%s blend=%s",
                name,
                validate(opts.fg),
                validate(opts.bg),
                validate(opts.style),
                validate(opts.sp),
                validate(opts.blend)
            )

            vim.cmd(group_output)
        end
    end
end

---Create highlight groups
---@param highlights table
---@return table|nil
function M.create(highlights)
    local utils = require("onedarkpro.utils")

    if utils.has_nvim_07 then
        return M.neovim_hl(highlights)
    end

    return M.vim_hl(highlights)
end

return M
