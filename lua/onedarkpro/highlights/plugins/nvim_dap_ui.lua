local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        DapUIScope = { bg = theme.palette.blue, fg = theme.palette.bg },
        DapUIType = { fg = theme.palette.blue },
        DapUIDecoration = { fg = theme.palette.blue },
        DapUIModifiedValue = { fg = theme.palette.cyan },
        DapUIThread = { fg = theme.palette.purple },
        DapUIStoppedThread = { bg = theme.palette.purple, fg = theme.palette.bg },
        DapUIFloatBorder = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.gray },
        DapUILineNumber = { fg = theme.palette.gray },
        DapUIFrameName = { fg = theme.palette.fg },
        DapUISource = { fg = theme.palette.purple },
        DapUIBreakpointsPath = { bg = theme.palette.yellow, fg = theme.palette.bg },
        DapUIBreakpointsInfo = { fg = theme.palette.fg },
        DapUIBreakpointsCurrentLine = { fg = theme.palette.yellow },
        DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
        DapUIWatchesEmpty = { bg = theme.palette.red, fg = theme.palette.bg },
        DapUIWatchesValue = { fg = theme.palette.red },
        DapUIWatchesError = { fg = theme.palette.red },
    }
end

return M
