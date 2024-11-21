local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@markup.heading"] = { fg = theme.palette.red },        
        ["@markup.quote.markdown"] = { fg = theme.palette.comment },
        ["@text.title.markdown"] = { fg = theme.palette.red, bold = true },
        ["@markup.list.markdown"] = { fg = theme.palette.yellow },
        ["@label.markdown"] = { fg = theme.palette.fg },
        ["@markup.raw.delimiter.markdown"] = { fg = theme.palette.fg },
        ["@punctuation.special.markdown"] = { fg = theme.palette.comment },

        ["@markup.strong.markdown_inline"] = { fg = theme.palette.orange, bold = true },
        ["@markup.italic.markdown_inline"] = { fg = theme.palette.purple, italic = true },
        ["@markup.raw.delimiter.markdown_inline"] = { fg = theme.palette.yellow },
        ["@parameter.markdown_inline"] = { fg = theme.palette.fg },
        ["@punctuation.delimiter.markdown_inline"] = { fg = theme.palette.orange },
        ["@text.literal.markdown_inline"] = { fg = theme.palette.green },
        ["@text.reference.markdown_inline"] = { fg = theme.palette.blue },
        ["@text.strong.markdown_inline"] = { fg = theme.palette.orange, bold = true },
        ["@text.uri.markdown_inline"] = { fg = theme.palette.purple },
    }
end

return M
