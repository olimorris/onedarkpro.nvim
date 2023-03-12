local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@operator.html"] = { fg = theme.palette.fg },
        ["@tag.attribute.html"] = { fg = theme.palette.orange, style = config.styles.tags },
        ["@text.uri.html"] = { fg = theme.palette.green, style = "underline" },
    }
end

return M
