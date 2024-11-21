local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@function.typescript"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@function.call.typescript"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@method.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@method.call.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
        ["@parameter.typescript"] = { fg = theme.palette.red, style = config.styles.parameters },
        ["@punctuation.bracket.typescript"] = { fg = theme.palette.orange },
        ["@variable.typescript"] = { fg = theme.palette.red, style = config.styles.variables },
        ["@variable.builtin.typescript"] = { fg = theme.palette.yellow, style = config.styles.variables },

        ["@odp.operator.fat_arrow.typescript"] = { fg = theme.palette.purple },
        ["@odp.property.function.typescript"] = { link = "@function.typescript" },

        -- LSP Semantic Tokens
        ["@lsp.type.enum.typescript"] = { fg = theme.palette.yellow },
        ["@lsp.type.interface.typescript"] = { fg = theme.palette.yellow },
        ["@lsp.typemod.enumMember.declaration.typescript"] = { fg = theme.palette.cyan },
        ["@lsp.mod.readonly.typescript"] = { fg = theme.palette.yellow },
        ["@lsp.mod.defaultLibrary.typescript"] = { fg = theme.palette.yellow },
        ["@lsp.typemod.member.defaultLibrary.typescript"] = { link = "@function.typescript" },
        ["@lsp.typemod.enumMember.readonly.typescript"] = { fg = theme.palette.cyan },
    }
end

return M
