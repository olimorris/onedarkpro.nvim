local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        -- Support for printf format characters
        ["@character.printf"] = { fg = theme.palette.orange },

        ["@constant.c"] = { fg = theme.palette.yellow },
        ["@constant.builtin.c"] = { fg = theme.palette.yellow },
        ["@function.builtin.c"] = { fg = theme.palette.cyan },
        ["@label.c"] = { fg = theme.palette.red },
        ["@type.builtin.c"] = { fg = theme.palette.purple },
        ["@type.qualifier.c"] = { fg = theme.palette.purple },
        ["@variable.parameter.c"] = { fg = theme.palette.red, style = config.styles.parameters },

        -- LSP Semantic Tokens
        ["@lsp.type.macro.c"] = { fg = theme.palette.orange, style = config.styles.constants },
        ["@lsp.typemod.function.defaultLibrary.c"] = { fg = theme.palette.cyan, style = config.styles.functions },
        ["@lsp.typemod.variable.readonly.c"] = { fg = theme.palette.yellow, style = config.styles.variable },
    }
end

return M
