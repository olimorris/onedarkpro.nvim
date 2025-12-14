local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    diffAdded = { fg = theme.generated.git_add },
    diffChanged = { fg = theme.generated.git_change },
    diffRemoved = { fg = theme.generated.git_delete },
  }
end

return M
