local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        TroubleNormal = { bg = "NONE" },

        TroubleCount = { fg = theme.palette.purple },
        TroubleFile = { fg = theme.palette.cyan },
        TroubleFoldIcon = { fg = theme.palette.fg },
        TroubleLocation = { fg = theme.palette.cyan },

        TroubleTextError = { fg = theme.palette.fg },
        TroubleTextInformation = { fg = theme.palette.fg },
        TroubleTextHint = { fg = theme.palette.fg },
        TroubleTextWarning = { fg = theme.palette.fg },
        TroubleText = { fg = theme.palette.fg },
    }
end

return M
