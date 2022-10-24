local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/caf7f61e94525bbd97e32f118efd6c0722430616/doc/indent_blankline.txt#L31
        IndentLine = { fg = theme.generated.indentline },
        IndentBlanklineChar = { link = "IndentLine" },
        IndentBlanklineSpaceChar = { link = "IndentLine" },
        IndentBlanklineSpaceCharBlankline = { link = "IndentLine" },
        IndentBlanklineContextChar = { fg = theme.palette.purple },
        IndentBlanklineContextStart = { style = "underline" },
    }
end

return M
