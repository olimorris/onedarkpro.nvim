local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        LspSagaDiagnosticBorder = { link = "NormalNC" },
        LspSagaDiagnosticHeader = { fg = theme.palette.purple },
        LspSagaDiagnosticTruncateLine = { link = "NormalNC" },
        LspFloatWinBorder = { link = "NormalNC" },
        LspSagaBorderTitle = { link = "Title" },
        TargetWord = { link = "Error" },
        ReferencesCount = { link = "Title" },
        ReferencesIcon = { link = "Special" },
        DefinitionCount = { link = "Title" },
        TargetFileName = { fg = theme.palette.gray },
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
        LspSagaRenamePromptPrefix = { fg = theme.palette.purple },
        LspSagaRenameBorder = { style = config.options.bold },
        LspSagaHoverBorder = { style = config.options.bold },
        LspSagaSignatureHelpBorder = { style = config.options.bold },
        LspSagaCodeActionBorder = { style = config.options.bold },
        LspSagaAutoPreview = {},
        LspSagaDefPreviewBorder = { style = config.options.bold },
        LspLinesDiagBorder = { style = config.options.bold },
    }
end

return M
