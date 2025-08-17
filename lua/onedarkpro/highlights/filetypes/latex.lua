local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")
    return {
        ["@markup.math.latex"] = { fg = theme.palette.orange },
        ["@module.latex"] = { fg = theme.palette.cyan },
        ["@odp.command.latex"] = { fg = theme.palette.green },
        ["@odp.curly_group_word.latex"] = { fg = theme.palette.red, style = config.styles.keywords },
    }
end

return M
