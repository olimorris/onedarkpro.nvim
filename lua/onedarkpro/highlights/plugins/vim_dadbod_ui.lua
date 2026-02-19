local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    NotificationInfo = { fg = theme.palette.gray },
    NotificationError = { fg = theme.palette.gray },
    NotificationWarning = { fg = theme.palette.gray },
  }
end

return M
