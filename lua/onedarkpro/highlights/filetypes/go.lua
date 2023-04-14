local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constant.go"] = { fg = theme.palette.red },
        ["@function.call.go"] = { fg = theme.palette.cyan },
        ["@method.call.go"] = { fg = theme.palette.cyan },
        ["@operator.go"] = { fg = theme.palette.yellow },
        ["@type.go"] = { fg = theme.palette.fg },
        ["@type.builtin.go"] = { fg = theme.palette.purple },
    }
end

return M
