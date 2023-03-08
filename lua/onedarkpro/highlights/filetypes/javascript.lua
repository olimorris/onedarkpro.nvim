local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constructor.javascript"] = { fg = theme.palette.yellow },
        ["@keyword.javascript"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@keyword.return.javascript"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@method.javascript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@method.call.javascript"] = { link = "@method.javascript" },
        ["@operator.fat_arrow.javascript"] = { fg = theme.palette.purple },
        ["@punctuation.bracket.javascript"] = { fg = theme.palette.orange },
        ["@expression.punctuation.bracket.javascript"] = { fg = theme.palette.cyan },
        ["@function.punctuation.bracket.javascript"] = { fg = theme.palette.blue },
        ["@statement.punctuation.bracket.javascript"] = { fg = theme.palette.purple },
        ["@jsxtag.javascript"] = { fg = theme.palette.orange, style = config.styles.keywords },
        ["@variable.javascript"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@variable.builtin.javascript"] = { fg = theme.palette.yellow, style = config.styles.variables },

        -- LSP Semantic Tokens
        ["@lsp.type.class.javascript"] = { fg = theme.palette.yellow },
        ["@lsp.type.namespace.javascript"] = { fg = theme.palette.yellow },
        ["@lsp.typemod.variable.defaultLibrary.javascript"] = { fg = theme.palette.yellow },
        ["@lsp.type.member.javascript"] = { fg = theme.palette.blue },
    }
end

return M
