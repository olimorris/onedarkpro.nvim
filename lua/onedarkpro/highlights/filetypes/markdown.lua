local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@text.literal.markdown_inline"] = { fg = theme.palette.green },
        ["@text.reference.markdown_inline"] = { fg = theme.palette.blue },
        ["@text.strong.markdown_inline"] = { fg = theme.palette.orange, bold = true },
        ["@markup.strong.markdown_inline"] = { link = "@text.strong.markdown_inline" },
        ["@text.title.markdown"] = { fg = theme.palette.red, bold = true },

        ["@markup.heading.1.markdown"] = { link = "@text.title.1.markdown" },
        ["@markup.heading.1.marker.markdown"] = { link = "@text.title.1.marker.markdown" },
        ["@markup.heading.2.markdown"] = { link = "@text.title.2.markdown" },
        ["@markup.heading.2.marker.markdown"] = { link = "@text.title.2.marker.markdown" },
        ["@markup.heading.3.markdown"] = { link = "@text.title.3.markdown" },
        ["@markup.heading.3.marker.markdown"] = { link = "@text.title.3.marker.markdown" },
        ["@markup.heading.4.markdown"] = { link = "@text.title.4.markdown" },
        ["@markup.heading.4.marker.markdown"] = { link = "@text.title.4.marker.markdown" },

        ["@parameter.markdown_inline"] = { fg = theme.palette.fg },
        ["@punctuation.special.markdown"] = { fg = theme.palette.red },
        ["@punctuation.delimiter.markdown_inline"] = { fg = theme.palette.orange },
        ["@markup.list.markdown"] = { link = "@punctuation.special.markdown" },
        ["@markup.list.checked.markdown"] = { fg = theme.palette.bg, bg = theme.palette.purple },

        ["@markup.raw.markdown_inline"] = { fg = theme.palette.green },

        ["@text.uri.markdown_inline"] = { fg = theme.palette.purple },
        ["@markup.link.url.markdown_inline"] = { link = "@text.uri.markdown_inline" },
        ["@markup.link.label.markdown_inline"] = { link = "@text.reference.markdown_inline" },
    }
end

return M
