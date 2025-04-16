local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        -- https://github.com/folke/snacks.nvim
        SnacksIndent = { fg = theme.generated.indentline },
        SnacksPickerCol = { fg = theme.generated.line_number },
        SnacksPickerDir = { link = "Text" },
        SnacksPickerBufFlags = { link = "SnacksPickerDir" },
        SnacksIndentScope = { fg = theme.palette.blue },
        SnacksIndentScope1 = { fg = theme.palette.blue },
        SnacksIndentScope2 = { fg = theme.palette.red },
        SnacksIndentScope3 = { fg = theme.palette.orange },
        SnacksIndentScope4 = { fg = theme.palette.yellow },
        SnacksIndentScope5 = { fg = theme.palette.green },
        SnacksIndentScope6 = { fg = theme.palette.cyan },
        SnacksIndentScope7 = { fg = theme.palette.purple },
        SnacksIndentScope8 = { fg = theme.palette.highlight },
    }
end

return M
