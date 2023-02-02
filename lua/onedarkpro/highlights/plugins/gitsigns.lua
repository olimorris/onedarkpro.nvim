local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        GitSignsAdd = { fg = theme.generated.git_add },
        GitSignsAddCursorLine = { fg = theme.generated.git_add, bg = theme.palette.cursorline },
        GitSignsChange = { fg = theme.generated.git_modify },
        GitSignsChangeCursorLine = { fg = theme.generated.git_modify, bg = theme.palette.cursorline },
        GitSignsDelete = { fg = theme.generated.git_delete },
        GitSignsDeleteCursorLine = { fg = theme.generated.git_delete, bg = theme.palette.cursorline },
        GitSignsUntracked = { fg = theme.palette.blue },
        GitSignsUntrackedCursorLine = { fg = theme.palette.blue, bg = theme.palette.cursorline },

        GitSignsAddInline = { bg = theme.generated.git_add },
        GitSignsDeleteInline = { bg = theme.generated.git_delete },
        GitSignsChangeInline = { bg = theme.generated.git_modify },
    }
end

return M
