local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@function.builtin.lua"] = { fg = theme.palette.cyan, style = config.styles.functions },
        ["@function.call.lua"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@field.lua"] = { fg = theme.palette.fg },
        ["@keyword.lua"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@keyword.operator.lua"] = { fg = theme.palette.fg },
        ["@method.lua"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@operator.lua"] = { fg = theme.palette.fg, style = config.styles.operators },
        ["@parameter.lua"] = { fg = theme.palette.fg, style = config.styles.parameters },
        ["@punctuation.bracket.lua"] = { fg = theme.palette.orange },

        -- LSP Semantic Tokens
        ["@lsp.typemod.function.defaultLibrary.lua"] = { fg = theme.palette.cyan },
        ["@lsp.type.class.lua"] = { fg = theme.palette.yellow },
        ["@lsp.typemod.variable.defaultLibrary.lua"] = { fg = theme.palette.yellow },
    }
end

return M
