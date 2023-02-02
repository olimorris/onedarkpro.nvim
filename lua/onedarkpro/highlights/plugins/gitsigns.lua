local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        GitSignsAdd = { fg = theme.generated.git_add },
        GitSignsAddCursorLine = { fg = theme.generated.git_add, bg = theme.palette.cursorline },
        GitSignsChange = { fg = theme.generated.git_change },
        GitSignsChangeCursorLine = { fg = theme.generated.git_change, bg = theme.palette.cursorline },
        GitSignsDelete = { fg = theme.generated.git_delete },
        GitSignsDeleteCursorLine = { fg = theme.generated.git_delete, bg = theme.palette.cursorline },
        GitSignsUntracked = { fg = theme.palette.blue },
        GitSignsUntrackedCursorLine = { fg = theme.palette.blue, bg = theme.palette.cursorline },

        GitSignsAddPreview = { bg = theme.generated.git_hunk_add },
        GitSignsDeletePreview = { bg = theme.generated.git_hunk_delete },
        GitSignsAddInline = { bg = theme.generated.git_hunk_add_inline },
        GitSignsChangeInline = { bg = theme.generated.git_hunk_change_inline },
        GitSignsDeleteInline = { bg = theme.generated.git_hunk_delete_inline },
    }
end

return M
