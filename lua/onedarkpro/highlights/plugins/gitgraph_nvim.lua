local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  return {
    GitGraphHash = { fg = theme.palette.red },
    GitGraphTimestamp = { fg = theme.palette.green },
    GitGraphAuthor = { fg = theme.palette.blue },
    GitGraphBranchName = { fg = theme.palette.yellow },
    GitGraphBranchTag = { fg = theme.palette.purple },
    GitGraphBranchMsg = { fg = theme.palette.comment },
    GitGraphBranch1 = { fg = theme.palette.yellow },
    GitGraphBranch2 = { fg = theme.palette.purple },
    GitGraphBranch3 = { fg = theme.palette.cyan },
    GitGraphBranch4 = { fg = theme.palette.green },
    GitGraphBranch5 = { fg = theme.palette.red },
  }
end

return M
