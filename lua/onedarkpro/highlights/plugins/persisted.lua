local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    PersistedTelescopeSelected = { fg = theme.palette.purple },
    PersistedTelescopeDir = { link = "Directory" },
    PersistedTelescopeBranch = { fg = theme.palette.purple },
  }
end

return M
