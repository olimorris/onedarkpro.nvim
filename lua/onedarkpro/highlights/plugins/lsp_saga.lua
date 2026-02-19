local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
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
    DefinitionPreviewTitle = { link = "Title" },
    LspSagaShTruncateLine = { link = "NormalNC" },
    LspSagaDocTruncateLine = { link = "NormalNC" },
    LineDiagTuncateLine = { link = "NormalNC" },
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionTruncateLine = { link = "NormalNC" },
    LspSagaCodeActionContent = { link = "Normal" },
    LspSagaRenamePromptPrefix = { fg = theme.palette.purple },
    -- LspSagaRenameBorder = {},
    -- LspSagaHoverBorder = {},
    -- LspSagaSignatureHelpBorder = {},
    -- LspSagaCodeActionBorder = {},
    -- LspSagaAutoPreview = {},
    -- LspSagaDefPreviewBorder = {},
    -- LspLinesDiagBorder = {},
  }
end

return M
