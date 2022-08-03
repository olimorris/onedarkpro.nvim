local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        DapUIScope = { bg = theme.palette.blue, fg = theme.palette.bg },
        DapUIType = { fg = theme.palette.blue },
        DapUIDecoration = { fg = theme.palette.blue },
        DapUIThread = { fg = theme.palette.purple },
        DapUIStoppedThread = { bg = theme.palette.purple, fg = theme.palette.bg },
        DapUIFrameName = { fg = theme.palette.fg },
        DapUISource = { fg = theme.palette.purple },
        DapUIBreakpointsPath = { bg = theme.palette.yellow, fg = theme.palette.bg },
        DapUIBreakpointsInfo = { fg = theme.palette.fg },
        DapUIBreakpointsCurrentLine = {
            fg = theme.palette.yellow,
            style = config.options.bold,
        },
        DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
        DapUIWatchesEmpty = { bg = theme.palette.red, fg = theme.palette.bg },
        DapUIWatchesValue = { fg = theme.palette.red },
        DapUIWatchesError = { fg = theme.palette.red },
    }
end

return M
