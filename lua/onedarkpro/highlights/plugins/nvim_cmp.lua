local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    -- https://github.com/hrsh7th/nvim-cmp/blob/main/doc/cmp.txt
    CmpDocumentation = { fg = theme.palette.fg, bg = theme.palette.menu },
    CmpDocumentationBorder = { fg = theme.palette.fg, bg = theme.palette.menu },

    CmpItemAbbr = { fg = theme.palette.fg },
    CmpItemAbbrDeprecated = { fg = theme.palette.fg },
    CmpItemAbbrMatch = { fg = theme.palette.blue },
    CmpItemAbbrMatchFuzzy = { fg = theme.palette.blue },
    CmpItemMenu = { fg = theme.palette.gray },

    CmpItemKindText = { fg = theme.palette.orange },
    CmpItemKindMethod = { fg = theme.palette.blue },
    CmpItemKindFunction = { link = "CmpItemKindMethod" },
    CmpItemKindConstructor = { fg = theme.palette.yellow },
    CmpItemKindField = { fg = theme.palette.blue },
    CmpItemKindClass = { fg = theme.palette.yellow },
    CmpItemKindInterface = { link = "CmpItemKindClass" },
    CmpItemKindModule = { fg = theme.palette.blue },
    CmpItemKindProperty = { fg = theme.palette.blue },
    CmpItemKindValue = { fg = theme.palette.orange },
    CmpItemKindEnum = { fg = theme.palette.yellow },
    CmpItemKindKeyword = { fg = theme.palette.purple },
    CmpItemKindSnippet = { fg = theme.palette.green },
    CmpItemKindFile = { fg = theme.palette.blue },
    CmpItemKindEnumMember = { fg = theme.palette.cyan },
    CmpItemKindConstant = { fg = theme.palette.green },
    CmpItemKindStruct = { fg = theme.palette.yellow },
    CmpItemKindTypeParameter = { fg = theme.palette.yellow },
    -- CmpItemKindUnit = {},
    -- CmpItemKindVColor = {},
    -- CmpItemKindReference = {},
    -- CmpItemKindFolder = {},
    -- CmpItemKindEvent = {},
    -- CmpItemKindOperator = {},
  }
end

return M
