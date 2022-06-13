local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        NeotestAdapterName = { fg = theme.colors.purple, style = theme.options.bold },
        -- NeotestBorder not implemented yet
        NeotestDir = { fg = theme.colors.cyan },
        NeotestExpandMarker = { fg = theme.colors.gray },
        NeotestFailed = { fg = theme.colors.red },
        NeotestFile = { fg = theme.colors.cyan },
        NeotestFocused = { bg = (theme.config.options.cursorline and theme.colors.cursorline or "NONE"), style = theme.options.bold },
        NeotestIndent = { fg = theme.colors.fg },
        NeotestNamespace = { fg = theme.colors.blue, style = theme.options.bold },
        NeotestPassed = { fg = theme.colors.green },
        NeotestRunning = { fg = theme.colors.yellow },
        NeotestSkipped = { fg = theme.colors.cyan },
        -- NeotestTest links to Normal
    }
end

return M
