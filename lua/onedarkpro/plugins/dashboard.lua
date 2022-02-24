local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- dashboardHeader = {},
        dashboardCenter = { fg = theme.colors.purple, style = theme.options.bold },
        dashboardFooter = { fg = theme.colors.blue },
        -- dashboardShortCut = {},
    }
end

return M
