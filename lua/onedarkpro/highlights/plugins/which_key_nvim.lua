local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        WhichKey = { fg = theme.palette.purple, style = config.options.bold },
        WhichKeyDesc = { fg = theme.palette.fg },
        WhichKeySeparator = { fg = theme.palette.green },
        WhichKeyFloat = { bg = theme.generated.cursorline },
        WhichKeyGroup = { fg = theme.palette.blue, style = config.options.italic },
    }
end

return M
