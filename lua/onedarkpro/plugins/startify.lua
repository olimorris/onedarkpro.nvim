local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        StartifyBracket = { fg = theme.colors.fg },
        StartifyFile = { fg = theme.colors.purple, style = theme.options.bold },
        StartifyFooter = { fg = theme.colors.fg },
        StartifyHeader = { fg = theme.colors.green },
        StartifyNumber = { fg = theme.colors.yellow },
        StartifyPath = { fg = theme.colors.gray },
        StartifySection = {
            fg = theme.colors.blue,
            style = theme.options.bold_italic,
        },
        StartifySelect = { fg = theme.colors.cyan },
        StartifySlash = { fg = theme.colors.gray },
        StartifySpecial = { fg = theme.colors.red },
    }
end

return M
