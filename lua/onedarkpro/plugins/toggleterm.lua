local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        ToggleTerm = { bg = theme.options.transparency, fg = theme.colors.fg },
        ToggleTermBorder = { fg = theme.colors.gray },
    }
end

return M
