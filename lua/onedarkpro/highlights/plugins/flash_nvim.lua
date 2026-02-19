local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    FlashBackdrop = { fg = theme.palette.comment },
    FlashLabel = { fg = theme.palette.bg, bg = theme.palette.purple, bold = true },
  }
end

return M
