local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constant.builtin.rust"] = { fg = theme.palette.yellow },
        ["@field.rust"] = { fg = theme.palette.red },
        ["@function.macro.rust"] = { link = "Function" },
        ["@operator.rust"] = { fg = theme.palette.fg },
        ["@storageclass.rust"] = { link = "@keyword" },
        ["@punctuation.bracket.rust"] = { fg = theme.palette.orange },
        ["@type.qualifier.rust"] = { fg = theme.palette.purple },
        ["@variable.rust"] = { fg = theme.palette.red, style = config.styles.variables },

        ["@odp.punctuation_arguments_brackets.rust"] = { fg = theme.palette.purple },
        ["@odp.punctuation_token_bracket.rust"] = { fg = theme.palette.cyan },
    }
end

return M
