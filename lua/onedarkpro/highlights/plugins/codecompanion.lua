local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  local config = require("onedarkpro.config")

  return {
    CodeCompanionChatHeader = { fg = theme.palette.purple, bold = true },
    CodeCompanionChatSeparator = { fg = theme.palette.gray },
    CodeCompanionChatTool = { fg = theme.palette.bg, bg = theme.palette.green },
    CodeCompanionChatToolGroup = { fg = theme.palette.bg, bg = theme.palette.orange },
    CodeCompanionChatEditorContext = { fg = theme.palette.bg, bg = theme.palette.blue },
    CodeCompanionChatVariable = { fg = theme.palette.bg, bg = theme.palette.blue },
  }
end

return M
