local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/caf7f61e94525bbd97e32f118efd6c0722430616/doc/indent_blankline.txt#L31
        IndentLine = { fg = theme.colors.indentline },
        IndentBlanklineChar = { link = "IndentLine" },
        IndentBlanklineSpaceChar = { link = "IndentLine" },
        IndentBlanklineSpaceCharBlankline = { link = "IndentLine" },
        IndentBlanklineContextChar = { fg = theme.colors.purple },
        IndentBlanklineContextStart = { style = "underline" },
    }
end

return M
