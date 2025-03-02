local M = {}

function M.groups(theme)
    return {
        MiniTestPass = { fg = theme.palette.green, bold = true },
        MiniTestFail = { fg = theme.palette.red, bold = true },
    }
end

return M
