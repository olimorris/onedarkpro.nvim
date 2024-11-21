local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@type.qualifier.java"] = { fg = theme.palette.purple },
        ["@type.builtin.java"] = { fg = theme.palette.purple },
    }
end

return M
