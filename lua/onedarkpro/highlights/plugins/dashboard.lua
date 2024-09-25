local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        -- General
        DashboardHeader = { fg = theme.palette.blue },
        DashboardFooter = { fg = theme.palette.blue },
        -- Hyper theme
        DashboardProjectTitle = { fg = theme.palette.cyan },
        DashboardProjectTitleIcon = { fg = theme.palette.orange },
        DashboardProjectIcon = { fg = theme.palette.yellow },
        DashboardMruTitle = { fg = theme.palette.cyan },
        DashboardMruIcon = { fg = theme.palette.purple },
        DashboardFiles = { fg = theme.palette.blue },
        DashboardShortCutIcon = { fg = theme.palette.red },
        -- Doome theme
        DashboardDesc = { fg = theme.palette.cyan },
        DashboardKey = { fg = theme.palette.orange },
        DashboardIcon = { fg = theme.palette.cyan, bold = true },
        DashboardShortCut = { fg = theme.palette.cyan },
    }
end

return M
