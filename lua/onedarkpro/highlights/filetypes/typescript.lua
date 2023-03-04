local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constant.typescript"] = { fg = theme.palette.yellow },
        ["@function.typescript"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@function.call.typescript"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@method.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@method.call.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@operator.fat_arrow.typescript"] = { fg = theme.palette.purple },
        ["@parameter.typescript"] = { fg = theme.palette.red, style = config.styles.parameters },
        ["@enum.member.typescript"] = { fg = theme.palette.cyan },
        ["@property.function.typescript"] = { link = "@function.typescript" },
        ["@punctuation.bracket.typescript"] = { fg = theme.palette.orange },
        ["@variable.typescript"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@variable.builtin.typescript"] = { fg = theme.palette.yellow, style = config.styles.variables },
    }
end

return M
