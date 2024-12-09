local M = {}

function M.groups(theme)
    return {
        MiniDiffOverAdd = { link = "DiffAdd" },
        MiniDiffOverChange = { link = "DiffChange" },
        MiniDiffOverContext = { link = "DiffText" },
        MiniDiffOverDelete = { link = "DiffDelete" },
        MiniDiffSignAdd = { fg = theme.generated.git_add },
        MiniDiffSignChange = { fg = theme.generated.git_change },
        MiniDiffSignDelete = { fg = theme.generated.git_delete },
    }
end

return M
