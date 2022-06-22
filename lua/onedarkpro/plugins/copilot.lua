local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        CopilotSuggestion = { fg = theme.colors.gray, style = theme.options.italic },
    }
end

return M
