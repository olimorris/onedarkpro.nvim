local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@field.yaml"] = { fg = theme.palette.red, style = config.options.italic },
        ["@string.yaml"] = { fg = theme.palette.green },
    }
end

return M
