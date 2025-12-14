local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    RainbowDelimiterRed = { fg = theme.palette.red },
    RainbowDelimiterYellow = { fg = theme.palette.yellow },
    RainbowDelimiterBlue = { fg = theme.palette.blue },
    RainbowDelimiterOrange = { fg = theme.palette.orange },
    RainbowDelimiterGreen = { fg = theme.palette.green },
    RainbowDelimiterViolet = { fg = theme.palette.purple },
    RainbowDelimiterCyan = { fg = theme.palette.cyan },
  }
end

return M
