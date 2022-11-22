local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        HlSearchNear = { bg = theme.palette.highlight, fg = theme.palette.bg },
        HlSearchLens = { bg = theme.palette.gray },
        HlSearchLensNear = { link = "HlSearchNear" },
        HlSearchFloat = { link = "HlSearchNear" },
    }
end

return M
