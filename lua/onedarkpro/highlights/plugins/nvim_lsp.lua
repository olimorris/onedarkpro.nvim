local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        -- Neovim 0.6+
        DiagnosticError = { fg = theme.palette.red },
        DiagnosticWarn = { fg = theme.palette.yellow },
        DiagnosticInfo = { fg = theme.palette.blue },
        DiagnosticHint = { fg = theme.palette.cyan },
        DiagnosticOk = { fg = theme.palette.green },

        DiagnosticSignError = { fg = theme.palette.red },
        DiagnosticSignWarn = { fg = theme.palette.yellow },
        DiagnosticSignInfo = { fg = theme.palette.blue },
        DiagnosticSignHint = { fg = theme.palette.cyan },

        DiagnosticUnderlineError = { fg = theme.palette.red, undercurl = true },
        DiagnosticUnderlineWarn = { fg = theme.palette.yellow, undercurl = true },
        DiagnosticUnderlineInfo = { fg = theme.palette.blue, undercurl = true },
        DiagnosticUnderlineHint = { fg = theme.palette.cyan, undercurl = true },

        DiagnosticVirtualTextError = { fg = theme.generated.virtual_text_error, style = config.styles.virtual_text },
        DiagnosticVirtualTextWarn = { fg = theme.generated.virtual_text_warning, style = config.styles.virtual_text },
        DiagnosticVirtualTextInfo = {
            fg = theme.generated.virtual_text_information,
            style = config.styles.virtual_text,
        },
        DiagnosticVirtualTextHint = { fg = theme.generated.virtual_text_hint, style = config.styles.virtual_text },

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

        LspInlayHint = { fg = theme.generated.inlay_hint },

        LspReferenceText = { bg = theme.generated.selection }, -- used for highlighting "text" references
        LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
        LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

        LspInfoBorder = { link = "FloatBorder" }, -- used for highlighting the LspInfo box
    }
end

return M
