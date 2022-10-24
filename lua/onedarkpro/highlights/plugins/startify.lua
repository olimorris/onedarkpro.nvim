local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        StartifyBracket = { fg = theme.palette.fg },
        StartifyFile = { fg = theme.palette.purple },
        StartifyFooter = { fg = theme.palette.fg },
        StartifyHeader = { fg = theme.palette.green },
        StartifyNumber = { fg = theme.palette.yellow },
        StartifyPath = { fg = theme.palette.gray },
        StartifySection = { fg = theme.palette.blue },
        StartifySelect = { fg = theme.palette.cyan },
        StartifySlash = { fg = theme.palette.gray },
        StartifySpecial = { fg = theme.palette.red },
    }
end

return M
