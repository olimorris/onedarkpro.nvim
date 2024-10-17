local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["xmlAttrib"] = { fg = theme.palette.orange },
        ["xmlTag"] = { fg = theme.palette.fg },
        ["xmlTagName"] = { fg = theme.palette.red },
    }
end

return M
