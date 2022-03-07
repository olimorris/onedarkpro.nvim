local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        rainbowcol1 = { fg = theme.colors.red },
        rainbowcol2 = { fg = theme.colors.yellow },
        rainbowcol3 = { fg = theme.colors.orange },
        rainbowcol4 = { fg = theme.colors.green },
        rainbowcol5 = { fg = theme.colors.blue },
        rainbowcol6 = { fg = theme.colors.cyan },
        rainbowcol7 = { fg = theme.colors.purple },
    }
end

return M
