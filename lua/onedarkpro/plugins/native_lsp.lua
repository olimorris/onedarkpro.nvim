local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
	return {
		LspDiagnosticsDefaultError = { link = "Error" },
		LspDiagnosticsDefaultWarning = { fg = theme.colors.yellow },
		LspDiagnosticsDefaultInformation = { fg = theme.colors.blue },
		LspDiagnosticsDefaultHint = { fg = theme.colors.cyan },

		LspDiagnosticsSignError = { link = "LspDiagnosticsDefaultError" },
		LspDiagnosticsSignWarning = { link = "LspDiagnosticsDefaultWarning" },
		LspDiagnosticsSignInformation = { link = "LspDiagnosticsDefaultInformation" },
		LspDiagnosticsSignHint = { link = "LspDiagnosticsDefaultHint" },

		LspDiagnosticsUnderlineError = { fg = theme.colors.red, style = theme.options.undercurl },
		LspDiagnosticsUnderlineWarning = { fg = theme.colors.yellow, style = theme.options.undercurl },
		LspDiagnosticsUnderlineInformation = { fg = theme.colors.blue, style = theme.options.undercurl },
		LspDiagnosticsUnderlineHint = { style = theme.options.undercurl },

		LspDiagnosticsVirtualTextError = { link = "LspDiagnosticsDefaultError" },
		LspDiagnosticsVirtualTextWarning = { link = "LspDiagnosticsDefaultWarning" },
		LspDiagnosticsVirtualTextInformation = { link = "LspDiagnosticsDefaultInformation" },
		LspDiagnosticsVirtualTextHint = { link = "LspDiagnosticsDefaultHint" },

		LspReferenceText = { bg = theme.colors.selection }, -- used for highlighting "text" references
		LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

		-- Neovim 0.6+
		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },

		DiagnosticSignError = { link = "LspDiagnosticsSignError" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },

		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },

		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
	}
end

return M
