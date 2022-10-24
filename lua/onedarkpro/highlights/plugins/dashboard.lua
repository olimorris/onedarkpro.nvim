local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        -- dashboardHeader = {},
        dashboardCenter = { fg = theme.palette.purple },
        dashboardFooter = { fg = theme.palette.blue },
        -- dashboardShortCut = {},
    }
end

return M
