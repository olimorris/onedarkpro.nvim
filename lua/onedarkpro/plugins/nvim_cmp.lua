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
		CmpItemAbbrMatch = { fg = theme.colors.cyan, style = theme.options.bold_italic },
		CmpItemAbbrMatchFuzzy = { fg = theme.colors.yellow },

		CmpItemMenu = { fg = theme.colors.fg },
		CmpItemKind = { fg = theme.colors.blue },
		CmpItemKindText = { fg = theme.colors.fg },
		CmpItemKindMethod = { fg = theme.colors.blue },
		CmpItemKindFunction = { link = "CmpItemKindMethod" },
		CmpItemKindConstructor = { fg = theme.colors.cyan },
		CmpItemKindField = { fg = theme.colors.fg },
		CmpItemKindVariable = { fg = theme.colors.red },
		CmpItemKindClass = { fg = theme.colors.yellow },
		CmpItemKindInterface = { link = "CmpItemKindClass" },
		-- CmpItemKindModule = {},
		CmpItemKindProperty = { fg = theme.colors.red },
		-- CmpItemKindUnit = {},
		CmpItemKindValue = { fg = theme.colors.orange },
		-- CmpItemKindEnum = {},
		CmpItemKindKeyword = { fg = theme.colors.purple },
		CmpItemKindSnippet = { fg = theme.colors.green },
		-- CmpItemKindVColor = {},
		-- CmpItemKindFile = {},
		-- CmpItemKindReference = {},
		-- CmpItemKindFolder = {},
		-- CmpItemKindEnumMember = {},
		CmpItemKindConstant = { fg = theme.colors.green },
		CmpItemKindStruct = { fg = theme.colors.yellow },
		-- CmpItemKindEvent = {},
		-- CmpItemKindOperator = {},
		-- CmpItemKindTypeParameter = {},
	}
end

return M
