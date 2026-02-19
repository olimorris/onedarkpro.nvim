local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    MasonHighlightBlockBold = { fg = theme.palette.bg, bg = theme.palette.purple, bold = true },
    MasonMutedBlock = { fg = theme.palette.bg, bg = theme.palette.fg },
    MasonHighlight = { fg = theme.palette.green },
    MasonMuted = { fg = theme.palette.fg },
    MasonWarning = { fg = theme.palette.yellow, italic = true },
  }
end

return M
