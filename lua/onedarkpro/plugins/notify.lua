local M = {}

---Get the highlight group for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        NotifyERRORBorder = { fg = theme.colors.red },
        NotifyERRORIcon = { fg = theme.colors.red },
        NotifyERRORTitle = { fg = theme.colors.red, style = "italic" },
        NotifyWARNBorder = { fg = theme.colors.yellow },
        NotifyWARNIcon = { fg = theme.colors.yellow },
        NotifyWARNTitle = { fg = theme.colors.yellow, style = "italic" },
        NotifyINFOBorder = { fg = theme.colors.blue },
        NotifyINFOIcon = { fg = theme.colors.blue },
        NotifyINFOTitle = { fg = theme.colors.blue, style = "italic" },
        NotifyDEBUGBorder = { fg = theme.colors.purple },
        NotifyDEBUGIcon = { fg = theme.colors.purple },
        NotifyDEBUGTitle = { fg = theme.colors.purple, style = "italic" },
        NotifyTRACEBorder = { fg = theme.colors.orange },
        NotifyTRACEIcon = { fg = theme.colors.orange },
        NotifyTRACETitle = { fg = theme.colors.orange, style = "italic" },
    }
end

return M
