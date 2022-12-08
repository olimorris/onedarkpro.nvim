local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ToggleTerm = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.fg },
        ToggleTermBorder = { fg = theme.palette.gray },
    }
end

return M
