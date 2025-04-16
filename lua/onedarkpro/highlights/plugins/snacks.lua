local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local highlights = {
        -- https://github.com/folke/snacks.nvim
        SnacksIndent = { fg = theme.generated.indentline },
        SnacksIndentScope = { fg = theme.palette.blue },
        SnacksPickerCol = { fg = theme.generated.line_number },
        SnacksPickerDir = { link = "Text" },
        SnacksPickerBufFlags = { link = "SnacksPickerDir" },
    }
    for i, color in ipairs(theme.rainbow) do
        highlights["SnacksIndentScope" .. i] = { fg = color }
    end

    return highlights
end

return M
