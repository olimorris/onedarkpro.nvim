local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- Neovim 0.6+
        DiagnosticError = { fg = theme.colors.red },
        DiagnosticWarn = { fg = theme.colors.yellow },
        DiagnosticInfo = { fg = theme.colors.blue },
        DiagnosticHint = { fg = theme.colors.cyan },

        DiagnosticSignError = { fg = theme.colors.red },
        DiagnosticSignWarn = { fg = theme.colors.yellow },
        DiagnosticSignInfo = { fg = theme.colors.blue },
        DiagnosticSignHint = { fg = theme.colors.cyan },

        DiagnosticUnderlineError = {
            fg = theme.colors.red,
            style = theme.options.undercurl,
        },
        DiagnosticUnderlineWarn = {
            fg = theme.colors.yellow,
            style = theme.options.undercurl,
        },
        DiagnosticUnderlineInfo = {
            fg = theme.colors.blue,
            style = theme.options.undercurl,
        },
        DiagnosticUnderlineHint = {
            fg = theme.colors.cyan,
            style = theme.options.undercurl,
        },

        DiagnosticVirtualTextError = { fg = theme.colors.virtual_text_error, style = theme.config.styles.virtual_text },
        DiagnosticVirtualTextWarn = { fg = theme.colors.virtual_text_warning, style = theme.config.styles.virtual_text },
        DiagnosticVirtualTextInfo = { fg = theme.colors.virtual_text_information, style = theme.config.styles.virtual_text },
        DiagnosticVirtualTextHint = { fg = theme.colors.virtual_text_hint, style = theme.config.styles.virtual_text },

        -- Neovim 0.5
        LspDiagnosticsDefaultError = { link = "DiagnosticError" },
        LspDiagnosticsDefaultWarning = { link = "DiagnosticWarn" },
        LspDiagnosticsDefaultInformation = { link = "DiagnosticInfo" },
        LspDiagnosticsDefaultHint = { link = "DiagnosticHint" },

        LspDiagnosticsSignError = { link = "DiagnosticSignError" },
        LspDiagnosticsSignWarning = { link = "DiagnosticSignWarn" },
        LspDiagnosticsSignInformation = { link = "DiagnosticSignInfo" },
        LspDiagnosticsSignHint = { link = "DiagnosticSignHint" },

        LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" },
        LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" },
        LspDiagnosticsUnderlineInformating = { link = "DiagnosticUnderlineInfo" },
        LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" },

        LspDiagnosticsVirtualTextError = { link = "DiagnosticVirtualTextError" },
        LspDiagnosticsVirtualTextWarning = { link = "DiagnosticVirtualTextWarn" },
        LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
        LspDiagnosticsVirtualTextHint = { link = "DiagnosticVirtualTextHint" },

        LspReferenceText = { bg = theme.colors.selection }, -- used for highlighting "text" references
        LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
        LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references
    }
end

return M
