local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        rainbowcol1 = { fg = theme.palette.red },
        rainbowcol2 = { fg = theme.palette.yellow },
        rainbowcol3 = { fg = theme.palette.orange },
        rainbowcol4 = { fg = theme.palette.green },
        rainbowcol5 = { fg = theme.palette.blue },
        rainbowcol6 = { fg = theme.palette.cyan },
        rainbowcol7 = { fg = theme.palette.purple },
    }
end

return M
