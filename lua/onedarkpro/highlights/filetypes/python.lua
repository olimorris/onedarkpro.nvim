local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@method.call.python"] = { fg = theme.palette.yellow },
        ["@constructor.python"] = { fg = theme.palette.cyan, style = config.options.bold },
    }
end

return M
