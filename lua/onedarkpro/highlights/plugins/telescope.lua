local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        TelescopeSelection = {
            bg = config.cursorline,
            fg = theme.palette.purple,
        },
        TelescopeSelectionCaret = { fg = theme.palette.purple },
        TelescopeMultiSelection = {
            bg = config.cursorline,
            fg = theme.palette.gray,
        },
        TelescopeNormal = { fg = theme.palette.fg },
        TelescopeBorder = { fg = theme.palette.gray },
        TelescopePromptBorder = { link = "TelescopeBorder" },
        TelescopePreviewBorder = { link = "TelescopeBorder" },
        TelescopeMatching = { fg = theme.palette.green },
        TelescopePromptPrefix = { fg = theme.palette.purple },
        TelescopePrompt = { link = "TelescopeNormal" },
    }
end

return M
