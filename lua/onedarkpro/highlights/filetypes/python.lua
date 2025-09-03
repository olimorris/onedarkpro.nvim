local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@conditional.python"] = { fg = theme.palette.purple, style = config.styles.conditionals },
        ["@constant.builtin.python"] = { fg = theme.palette.orange, style = config.styles.constants },
        ["@keyword.function.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@include.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@method.call.python"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@variable.builtin.python"] = { fg = theme.palette.yellow, style = config.styles.variables },
        ["@punctuation.bracket.python"] = { fg = theme.palette.orange },

        ["@odp.base_constructor.python"] = { fg = theme.palette.cyan },
        ["@odp.constructor.python"] = { link = "@constructor" },
        ["@odp.decorator.python"] = { link = "@function" },
        ["@odp.decorator.function.python"] = { link = "@function" },
        ["@odp.function.builtin.python"] = { link = "@function" },
        ["@odp.import_from.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@odp.import_module.python"] = { fg = theme.palette.fg },
        ["@odp.interpolation.python"] = { fg = theme.palette.red, style = config.styles.parameters },
        ["@odp.keyword.python"] = { style = config.styles.keywords },
        ["@odp.keyword.class.python"] = { link = "@keyword.function.python" },
        ["@odp.operator.splat.python"] = { fg = theme.palette.fg },
        ["@odp.punctuation.bracket.python"] = { fg = theme.palette.orange },
        ["@odp.bracket.subscript.open.python"] = { fg = theme.palette.purple },
        ["@odp.bracket.subscript.close.python"] = { fg = theme.palette.purple },
        ["@odp.punctuation.special.python"] = { fg = theme.palette.purple },
        ["@odp.variable.parameter.python"] = { link = "@variable.parameter.python" },
    }
end

return M
