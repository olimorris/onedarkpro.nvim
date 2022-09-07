local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        OpSidebarHeader = { fg = theme.palette.fg, style = config.options.bold },
        OpSidebarItem = { fg = theme.palette.fg, style = config.options.italic },
        OpSidebarFavoriteIcon = { fg = theme.palette.orange },
        OpSidebarIconDefault = { fg = theme.palette.blue },
    }
end

return M
