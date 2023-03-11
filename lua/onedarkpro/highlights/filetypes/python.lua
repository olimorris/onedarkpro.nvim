local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@conditional.python"] = { fg = theme.palette.purple, style = config.styles.conditionals },
        ["@constant.builtin.python"] = { fg = theme.palette.orange, style = config.styles.constants },
        ["@include.python"] = { fg = theme.palette.fg, style = config.styles.keywords },
        ["@method.call.python"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@variable.builtin.python"] = { fg = theme.palette.yellow, style = config.styles.variables },

        ["@odp.base_constructor.python"] = { fg = theme.palette.cyan },
        ["@odp.import_from.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@odp.keyword.python"] = { style = config.styles.keywords },
        ["@odp.keyword.class.python"] = { link = "@keyword.function.python" },
        ["@odp.operator.splat.python"] = { fg = theme.palette.fg },
        ["@odp.punctuation.brace.python"] = { fg = theme.palette.purple },
    }
end

return M
