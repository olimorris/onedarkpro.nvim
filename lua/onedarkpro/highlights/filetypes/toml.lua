local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        ["@operator.toml"] = { fg = theme.palette.fg },
        ["@property.toml"] = { fg = theme.palette.purple },
    }
end

return M
