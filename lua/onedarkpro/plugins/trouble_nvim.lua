local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        TroubleCount = { fg = theme.colors.purple, style = theme.options.bold },
        TroubleFile = { bg = "NONE", fg = theme.colors.cyan },
        TroubleFoldIcon = { bg = "NONE", fg = theme.colors.fg },
        TroubleLocation = { bg = "NONE", fg = theme.colors.cyan },
    }
end

return M
