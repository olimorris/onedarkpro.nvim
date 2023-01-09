local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@text.literal.markdown_inline"] = { fg = theme.palette.green },
        ["@text.reference.markdown_inline"] = { fg = theme.palette.blue },
        ["@text.strong.markdown_inline"] = { fg = theme.palette.orange, style = "bold" },
        ["@text.title.markdown"] = { fg = theme.palette.red, style = "bold" },
        ["@parameter.markdown_inline"] = { fg = theme.palette.fg },
        ["@punctuation.special.markdown"] = { fg = theme.palette.red },
        ["@punctuation.delimiter.markdown_inline"] = { fg = theme.palette.orange },
        ["@text.uri.markdown_inline"] = { fg = theme.palette.purple },
    }
end

return M
