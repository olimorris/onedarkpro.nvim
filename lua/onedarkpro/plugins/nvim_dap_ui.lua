local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        DapUIScope = { bg = theme.colors.blue, fg = theme.colors.bg },
        DapUIType = { fg = theme.colors.blue },
        DapUIDecoration = { fg = theme.colors.blue },
        DapUIThread = { fg = theme.colors.purple },
        DapUIStoppedThread = { bg = theme.colors.purple, fg = theme.colors.bg },
        DapUIFrameName = { fg = theme.colors.fg },
        DapUISource = { fg = theme.colors.purple },
        DapUIBreakpointsPath = { bg = theme.colors.yellow, fg = theme.colors.bg },
        DapUIBreakpointsInfo = { fg = theme.colors.fg },
        DapUIBreakpointsCurrentLine = {
            fg = theme.colors.yellow,
            style = theme.options.bold,
        },
        DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
        DapUIWatchesEmpty = { bg = theme.colors.red, fg = theme.colors.bg },
        DapUIWatchesValue = { fg = theme.colors.red },
        DapUIWatchesError = { fg = theme.colors.red },
    }
end

return M
