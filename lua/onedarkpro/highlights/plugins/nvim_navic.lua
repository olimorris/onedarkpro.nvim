local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        NavicIconsClass = { fg = theme.palette.purple },
        NavicIconsFunction = { fg = theme.palette.blue },
        NavicIconsVariable = { fg = theme.palette.orange },
        NavicIconsConstant = { fg = theme.palette.orange },
        NavicIconsBoolean = { fg = theme.palette.orange },
        NavicIconsString = { fg = theme.palette.green },
        NavicIconsObject = { fg = theme.palette.purple },
        NavicIconsProperty = { fg = theme.palette.fg },
        NavicText = { fg = theme.palette.gray },
        NavicSeparator = { fg = theme.palette.gray },
    }
end

return M
