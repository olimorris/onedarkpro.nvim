local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        DebugBreakpoint = { fg = theme.colors.red },
        DebugBreakpointLine = {
            fg = theme.colors.red,
            style = theme.options.underline,
        },
        DebugHighlight = { fg = theme.colors.blue },
        DebugHighlightLine = {
            fg = theme.colors.purple,
            style = theme.options.italic,
        },
        NvimDapVirtualText = {
            fg = theme.colors.cyan,
            style = theme.options.italic,
        },
    }
end

return M
