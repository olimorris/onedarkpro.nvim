local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        LspSagaDiagnosticBorder = { link = "NormalNC" },
        LspSagaDiagnosticHeader = { fg = theme.colors.purple },
        LspSagaDiagnosticTruncateLine = { link = "NormalNC" },
        LspFloatWinBorder = { link = "NormalNC" },
        LspSagaBorderTitle = { link = "Title" },
        TargetWord = { link = "Error" },
        ReferencesCount = { link = "Title" },
        ReferencesIcon = { link = "Special" },
        DefinitionCount = { link = "Title" },
        TargetFileName = { fg = theme.colors.comment },
        DefinitionIcon = { link = "Special" },
        ProviderTruncateLine = { link = "NormalNC" },
        SagaShadow = {},
        LspSagaFinderSelection = { link = "Search" },
        DiagnosticTruncateLine = { link = "NormalNC" },
        DiagnosticError = { link = "LspDiagnosticsDefaultError" },
        DiagnosticWarning = { link = "LspDiagnosticsDefaultWarning" },
        DiagnosticInformation = { link = "LspDiagnosticsDefaultInformation" },
        DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
        DefinitionPreviewTitle = { link = "Title" },
        LspSagaShTruncateLine = { link = "NormalNC" },
        LspSagaDocTruncateLine = { link = "NormalNC" },
        LineDiagTuncateLine = { link = "NormalNC" },
        LspSagaCodeActionTitle = { link = "Title" },
        LspSagaCodeActionTruncateLine = { link = "NormalNC" },
        LspSagaCodeActionContent = { link = "Normal" },
        LspSagaRenamePromptPrefix = { fg = theme.colors.purple },
        LspSagaRenameBorder = { style = theme.options.bold },
        LspSagaHoverBorder = { style = theme.options.bold },
        LspSagaSignatureHelpBorder = { style = theme.options.bold },
        LspSagaCodeActionBorder = { style = theme.options.bold },
        LspSagaAutoPreview = {},
        LspSagaDefPreviewBorder = { style = theme.options.bold },
        LspLinesDiagBorder = { style = theme.options.bold },
    }
end

return M
