local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        TelescopeSelection = {
            bg = theme.options.cursorline,
            fg = theme.colors.purple,
        },
        TelescopeSelectionCaret = { fg = theme.colors.purple },
        TelescopeMultiSelection = {
            bg = theme.options.cursorline,
            fg = theme.colors.comment,
        },
        TelescopeNormal = { fg = theme.colors.fg },
        TelescopeBorder = { fg = theme.colors.comment },
        TelescopePromptBorder = { link = "TelescopeBorder" },
        TelescopePreviewBorder = { link = "TelescopeBorder" },
        TelescopeMatching = { fg = theme.colors.green },
        TelescopePromptPrefix = { fg = theme.colors.purple },
        TelescopePrompt = { link = "TelescopeNormal" },
    }
end

return M
