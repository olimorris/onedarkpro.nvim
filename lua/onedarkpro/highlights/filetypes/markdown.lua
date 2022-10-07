local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@text.literal.markdown"] = { fg = theme.palette.green },
        ["@text.reference.markdown"] = { fg = theme.palette.blue },
        ["@text.title.markdown"] = { fg = theme.palette.red, style = config.options.bold },
        ["@parameter.markdown"] = { fg = theme.palette.fg },
        ["@punctuation.special.markdown"] = { fg = theme.palette.red },
        ["@punctuation.delimiter.markdown"] = { fg = theme.palette.gray },
        ["@text.uri.markdown"] = { fg = theme.palette.green },
    }
end

return M
