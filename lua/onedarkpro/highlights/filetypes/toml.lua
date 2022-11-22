local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    return {
        ["@operator.toml"] = { fg = theme.palette.fg },
        ["@property.toml"] = { fg = theme.palette.purple },
    }
end

return M
