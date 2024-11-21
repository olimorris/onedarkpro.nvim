local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@label.json"] = { fg = theme.palette.red },

        ["@odp.braces.json"] = { fg = theme.palette.cyan },
        ["@odp.brackets.json"] = { fg = theme.palette.orange },
    }
end

return M
