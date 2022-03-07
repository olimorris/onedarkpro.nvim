local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        HlSearchNear = { bg = theme.colors.highlight, fg = theme.colors.bg },
        HlSearchLens = { bg = theme.colors.gray },
        HlSearchLensNear = { link = "HlSearchNear" },
        HlSearchFloat = { link = "HlSearchNear" },
    }
end

return M
