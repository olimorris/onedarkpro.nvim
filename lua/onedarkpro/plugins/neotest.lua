local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        NeotestAdapterName = { fg = theme.colors.red },
        -- NeotestBorder not implemented yet
        NeotestDir = { fg = theme.colors.blue },
        NeotestExpandMarker = { fg = theme.colors.gray },
        NeotestFailed = { fg = theme.colors.red },
        NeotestFile = { fg = theme.colors.blue },
        NeotestFocused = { fg = theme.colors.fg, style = theme.options.bold },
        NeotestIndent = { fg = theme.colors.fg },
        NeotestNamespace = { fg = theme.colors.purple },
        NeotestPassed = { fg = theme.colors.green },
        NeotestRunning = { fg = theme.colors.yellow },
        NeotestSkipped = { fg = theme.colors.cyan },
        -- NeotestTest links to Normal
    }
end

return M
