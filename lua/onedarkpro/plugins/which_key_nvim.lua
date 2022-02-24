local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        WhichKey = { fg = theme.colors.purple, style = theme.options.bold },
        WhichKeyDesc = { fg = theme.colors.fg },
        WhichKeySeparator = { fg = theme.colors.green },
        WhichKeyFloat = { bg = theme.options.cursorline },
        WhichKeyGroup = { fg = theme.colors.blue, style = theme.options.italic },
    }
end

return M
