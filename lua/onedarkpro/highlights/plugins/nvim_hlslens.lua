local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        HlSearchNear = { bg = theme.palette.highlight, fg = theme.palette.bg },
        HlSearchLens = { bg = theme.palette.gray },
        HlSearchLensNear = { link = "HlSearchNear" },
        HlSearchFloat = { link = "HlSearchNear" },
    }
end

return M
