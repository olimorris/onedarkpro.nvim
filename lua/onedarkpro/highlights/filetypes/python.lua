local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@base_constructor.python"] = { fg = theme.palette.cyan },
        ["@conditional.python"] = { fg = theme.palette.purple, style = config.styles.conditionals },
        ["@constant.builtin.python"] = { fg = theme.palette.orange, style = config.styles.constants },
        ["@include.python"] = { fg = theme.palette.fg, style = config.styles.keywords },
        ["@import_from.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@keyword.python"] = { style = config.styles.keywords },
        ["@method.call.python"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@operator.splat.python"] = { fg = theme.palette.fg },
        ["@punctuation.brace.python"] = { fg = theme.palette.purple },
        ["@variable.builtin.python"] = { fg = theme.palette.yellow, style = config.styles.variables },
    }
end

return M
