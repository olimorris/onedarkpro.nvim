local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    FlashBackdrop = { fg = theme.palette.comment },
    FlashLabel = { fg = theme.palette.bg, bg = theme.palette.yellow },
  }
end

return M
