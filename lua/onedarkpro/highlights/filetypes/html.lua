local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@operator.html"] = { fg = theme.palette.fg },
        ["@tag.attribute.html"] = { fg = theme.palette.orange, style = config.styles.tags },
        ["@string.special.url.html"] = { fg = theme.palette.gree, underline = true },
        ["@text.uri.html"] = { fg = theme.palette.green, underline = true },
    }
end

return M
