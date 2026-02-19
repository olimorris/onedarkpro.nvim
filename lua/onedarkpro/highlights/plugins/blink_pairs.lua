local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    BlinkPairsOrange = { fg = theme.palette.orange },
    BlinkPairsPurple = { fg = theme.palette.purple },
    BlinkPairsBlue = { fg = theme.palette.blue },
    BlinkPairsYellow = { fg = theme.palette.yellow },
    BlinkPairsGreen = { fg = theme.palette.green },
    BlinkPairsCyan = { fg = theme.palette.cyan },
    BlinkPairsUnmatched = { fg = theme.palette.red },
  }
end

return M
