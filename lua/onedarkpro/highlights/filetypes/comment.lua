local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@odp.uri.comment"] = { link = "@text.uri.comment" },
    }
end

return M
