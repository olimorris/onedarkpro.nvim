local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        DebugBreakpoint = { fg = theme.palette.red },
        DebugBreakpointLine = {
            fg = theme.palette.red,
            style = config.options.underline,
        },
        DebugHighlight = { fg = theme.palette.blue },
        DebugHighlightLine = {
            fg = theme.palette.purple,
            style = config.options.italic,
        },
        NvimDapVirtualText = {
            fg = theme.palette.cyan,
            style = config.options.italic,
        },
    }
end

return M
