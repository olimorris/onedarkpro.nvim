local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        AerialClass = {
            fg = theme.palette.purple,
            style = config.options.bold_italic,
        },
    }
end

return M
