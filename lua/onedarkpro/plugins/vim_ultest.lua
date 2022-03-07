local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        UltestPass = { fg = theme.colors.green },
        UltestFail = { fg = theme.colors.red },
        UltestRunning = { fg = theme.colors.yellow },
        UltestBorder = { fg = theme.colors.comment },
        UltestInfo = { fg = theme.colors.purple, style = theme.options.bold },
    }
end

return M
