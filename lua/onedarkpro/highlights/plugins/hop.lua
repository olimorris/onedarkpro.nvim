local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    -- https://github.com/phaazon/hop.nvim/blob/e3c9fc3ab1e1db6bfb4f19377c53d0e457e0e2e9/doc/hop.txt#L759
    HopNextKey = { bg = theme.palette.green, fg = theme.palette.bg },
    HopNextKey1 = { bg = theme.palette.yellow, fg = theme.palette.bg },
    HopNextKey2 = { link = "HopNextKey1" },
    HopUnmatched = { fg = theme.palette.gray },
    HopCursor = { link = "Cursor" },
  }
end

return M
