local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@constant.go"] = { fg = theme.palette.red, style = config.styles.constant },
        ["@function.call.go"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@method.call.go"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@function.builtin.go"] = { fg = theme.palette.cyan, style = config.styles.functions },
        ["@operator.go"] = { fg = theme.palette.cyan, style = config.styles.operators },
        ["@type.go"] = { fg = theme.palette.yellow, style = config.styles.types },
        ["@type.builtin.go"] = { fg = theme.palette.purple, style = config.styles.types },
        ["@field.go"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@property.go"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@variable.go"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@parameter.go"] = { fg = theme.palette.red, style = config.styles.parameters },
    }
end

return M
