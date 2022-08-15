local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        UltestPass = { fg = theme.palette.green },
        UltestFail = { fg = theme.palette.red },
        UltestRunning = { fg = theme.palette.yellow },
        UltestBorder = { fg = theme.palette.gray },
        UltestInfo = { fg = theme.palette.purple, style = config.options.bold },
    }
end

return M
