local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@function.typescript"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@function.call.typescript"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@method.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@method.call.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@parameter.typescript"] = { fg = theme.palette.red, style = config.styles.parameters },
        ["@punctuation.bracket.typescript"] = { fg = theme.palette.orange },
        ["@variable.typescript"] = { fg = theme.palette.red },
    }
end

return M
