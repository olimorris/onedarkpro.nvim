local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        -- dashboardHeader = {},
        dashboardCenter = { fg = theme.palette.purple, style = config.options.bold },
        dashboardFooter = { fg = theme.palette.blue },
        -- dashboardShortCut = {},
    }
end

return M
