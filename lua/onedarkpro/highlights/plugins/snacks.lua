local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        -- https://github.com/folke/snacks.nvim
        SnacksIndent = { fg = theme.generated.indentline },
        SnacksIndentScope = { fg = theme.palette.blue },
    }
end

return M
