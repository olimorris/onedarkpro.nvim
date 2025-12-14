local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
  return {
    -- This only works for the HTML portion of *.vue files
    ["@method.vue"] = { fg = theme.palette.orange },
    ["@operator.vue"] = { fg = theme.palette.fg },
    ["@tag.attribute.vue"] = { fg = theme.palette.orange },
  }
end

return M
