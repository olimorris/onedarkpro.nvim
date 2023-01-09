local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constructor.python"] = { fg = theme.palette.cyan },
        ["@conditional.python"] = { fg = theme.palette.purple, style = config.styles.conditionals },
        ["@method.call.python"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@variable.builtin.python"] = { fg = theme.palette.yellow, style = config.styles.variables },
    }
end

return M
