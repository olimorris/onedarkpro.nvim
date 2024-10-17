local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        BqfPreviewBorder = { fg = theme.palette.gray },
        BqfPreviewRange = { fg = theme.palette.green },
        BqfSign = { fg = theme.palette.purple, bold = true },
    }
end

return M
