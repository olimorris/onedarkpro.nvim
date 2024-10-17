local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@property.scss"] = { fg = theme.palette.fg },
        ["@punctuation.bracket.scss"] = { fg = theme.palette.orange },
        ["@string.scss"] = { fg = theme.palette.orange, style = config.styles.string },
        ["@type.scss"] = { fg = theme.palette.red },

        ["@odp.nesting_selector.scss"] = { fg = theme.palette.red },
        ["@odp.pseudo_class.scss"] = { fg = theme.palette.cyan },
        ["@odp.selector.scss"] = { fg = theme.palette.orange },
        ["@odp.variable.scss"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@odp.vendor_prefix.scss"] = { fg = theme.palette.cyan },
    }
end

return M
