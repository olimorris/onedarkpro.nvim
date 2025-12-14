local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    BlinkIndentRed = { fg = theme.palette.red },
    BlinkIndentOrange = { fg = theme.palette.orange },
    BlinkIndentYellow = { fg = theme.palette.yellow },
    BlinkIndentGreen = { fg = theme.palette.green },
    BlinkIndentCyan = { fg = theme.palette.cyan },
    BlinkIndentBlue = { fg = theme.palette.blue },
    BlinkIndentViolet = { fg = theme.palette.purple },

    BlinkIndentRedUnderline = { sp = theme.palette.red, underline = true },
    BlinkIndentOrangeUnderline = { sp = theme.palette.orange, underline = true },
    BlinkIndentYellowUnderline = { sp = theme.palette.yellow, underline = true },
    BlinkIndentGreenUnderline = { sp = theme.palette.green, underline = true },
    BlinkIndentCyanUnderline = { sp = theme.palette.cyan, underline = true },
    BlinkIndentBlueUnderline = { sp = theme.palette.blue, underline = true },
    BlinkIndentVioletUnderline = { sp = theme.palette.purple, underline = true },
  }
end

return M
