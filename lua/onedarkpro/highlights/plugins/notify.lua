local M = {}

---Get the highlight group for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        NotifyERRORBorder = { fg = theme.palette.red },
        NotifyERRORIcon = { fg = theme.palette.red },
        NotifyERRORTitle = { fg = theme.palette.red, style = "italic" },
        NotifyWARNBorder = { fg = theme.palette.yellow },
        NotifyWARNIcon = { fg = theme.palette.yellow },
        NotifyWARNTitle = { fg = theme.palette.yellow, style = "italic" },
        NotifyINFOBorder = { fg = theme.palette.blue },
        NotifyINFOIcon = { fg = theme.palette.blue },
        NotifyINFOTitle = { fg = theme.palette.blue, style = "italic" },
        NotifyDEBUGBorder = { fg = theme.palette.purple },
        NotifyDEBUGIcon = { fg = theme.palette.purple },
        NotifyDEBUGTitle = { fg = theme.palette.purple, style = "italic" },
        NotifyTRACEBorder = { fg = theme.palette.orange },
        NotifyTRACEIcon = { fg = theme.palette.orange },
        NotifyTRACETitle = { fg = theme.palette.orange, style = "italic" },
    }
end

return M
