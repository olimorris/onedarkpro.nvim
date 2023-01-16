local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        GitSignsAdd = { fg = theme.palette.green },
        GitSignsAddCursorLine = { fg = theme.palette.green, bg = theme.palette.cursorline },
        GitSignsChange = { fg = theme.palette.yellow },
        GitSignsChangeCursorLine = { fg = theme.palette.yellow, bg = theme.palette.cursorline },
        GitSignsDelete = { fg = theme.palette.red },
        GitSignsDeleteCursorLine = { fg = theme.palette.red, bg = theme.palette.cursorline },
        GitSignsUntracked = { fg = theme.palette.blue },
        GitSignsUntrackedCursorLine = { fg = theme.palette.blue, bg = theme.palette.cursorline },
    }
end

return M
