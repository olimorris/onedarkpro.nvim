local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constant.go"] = { fg = theme.palette.red },
        ["@function.call.go"] = { fg = theme.palette.blue },
        ["@method.call.go"] = { fg = theme.palette.blue },
        ["@function.builtin.go"] = { fg = theme.palette.cyan },
        ["@operator.go"] = { fg = theme.palette.cyan },
        ["@type.go"] = { fg = theme.palette.yellow },
        ["@type.builtin.go"] = { fg = theme.palette.purple },
        ["@field.go"] = { fg = theme.palette.red },
        ["@property.go"] = { fg = theme.palette.red },
        ["@variable.go"] = { fg = theme.palette.red },
        ["@parameter.go"] = { fg = theme.palette.red },
    }
end

return M
