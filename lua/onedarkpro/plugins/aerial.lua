local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        AerialClass = {
            fg = theme.colors.purple,
            style = theme.options.bold_italic,
        },
    }
end

return M
