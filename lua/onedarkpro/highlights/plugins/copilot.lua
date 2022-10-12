local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        CopilotSuggestion = { fg = theme.palette.gray },
    }
end

return M
