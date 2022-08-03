local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        NeotestAdapterName = { fg = theme.palette.purple, style = config.options.bold },
        -- NeotestBorder not implemented yet
        NeotestDir = { fg = theme.palette.cyan },
        NeotestExpandMarker = { fg = theme.palette.gray },
        NeotestFailed = { fg = theme.palette.red },
        NeotestFile = { fg = theme.palette.cyan },
        NeotestFocused = {
            bg = (config.options.cursorline and theme.generated.cursorline or "NONE"),
            style = config.options.bold,
        },
        NeotestIndent = { fg = theme.palette.fg },
        NeotestNamespace = { fg = theme.palette.blue, style = config.options.bold },
        NeotestPassed = { fg = theme.palette.green },
        NeotestRunning = { fg = theme.palette.yellow },
        NeotestSkipped = { fg = theme.palette.cyan },
        -- NeotestTest links to Normal
    }
end

return M
