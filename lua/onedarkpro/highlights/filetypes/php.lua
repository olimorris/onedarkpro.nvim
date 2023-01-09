local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@method.php"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@method.call.php"] = { link = "@method.php" },
        ["@function.builtin.php"] = { fg = theme.palette.cyan },
        ["@namespace.php"] = { fg = theme.palette.yellow, style = config.styles.keywords },
        ["@constant.builtin.php"] = { fg = theme.palette.orange },
        ["@type.qualifier.php"] = { link = "@keyword.function.php" },
    }
end

return M
