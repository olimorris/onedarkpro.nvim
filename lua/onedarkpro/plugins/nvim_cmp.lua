local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt
        CmpDocumentation = { fg = theme.colors.fg, bg = theme.colors.menu },
        CmpDocumentationBorder = { fg = theme.colors.fg, bg = theme.colors.menu },

        CmpItemAbbr = { fg = theme.colors.fg },
        CmpItemAbbrDeprecated = { fg = theme.colors.fg },
        CmpItemAbbrMatch = {
            fg = theme.colors.blue,
            style = theme.options.bold,
        },
        CmpItemAbbrMatchFuzzy = { fg = theme.colors.blue, style = theme.options.underline },
        CmpItemMenu = { fg = theme.colors.gray },

        CmpItemKindText = { fg = theme.colors.orange },
        CmpItemKindMethod = { fg = theme.colors.blue },
        CmpItemKindFunction = { link = "CmpItemKindMethod" },
        CmpItemKindConstructor = { fg = theme.colors.yellow },
        CmpItemKindField = { fg = theme.colors.blue },
        CmpItemKindClass = { fg = theme.colors.yellow },
        CmpItemKindInterface = { link = "CmpItemKindClass" },
        CmpItemKindModule = { fg = theme.colors.blue },
        CmpItemKindProperty = { fg = theme.colors.blue },
        CmpItemKindValue = { fg = theme.colors.orange },
        CmpItemKindEnum = { fg = theme.colors.yellow },
        CmpItemKindKeyword = { fg = theme.colors.purple },
        CmpItemKindSnippet = { fg = theme.colors.green },
        CmpItemKindFile = { fg = theme.colors.blue },
        CmpItemKindEnumMember = { fg = theme.colors.cyan },
        CmpItemKindConstant = { fg = theme.colors.green },
        CmpItemKindStruct = { fg = theme.colors.yellow },
        CmpItemKindTypeParameter = { fg = theme.colors.yellow },
        -- CmpItemKindUnit = {},
        -- CmpItemKindVColor = {},
        -- CmpItemKindReference = {},
        -- CmpItemKindFolder = {},
        -- CmpItemKindEvent = {},
        -- CmpItemKindOperator = {},
    }
end

return M
