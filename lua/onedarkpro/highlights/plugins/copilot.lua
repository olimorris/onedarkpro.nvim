local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        CopilotSuggestion = { fg = theme.palette.gray, style = config.styles.virtual_text },
    }
end

return M
