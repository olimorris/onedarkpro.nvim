local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        -- dashboardHeader = {},
        dashboardCenter = { fg = theme.palette.purple },
        dashboardFooter = { fg = theme.palette.blue },
        -- dashboardShortCut = {},
    }
end

return M
