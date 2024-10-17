local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@lsp.type.class"] = { fg = theme.palette.yellow },
        ["@lsp.type.enum"] = { link = "@type" },
        ["@lsp.type.enumMember"] = { fg = theme.palette.cyan },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.interface"] = { fg = theme.palette.yellow },
        ["@lsp.type.namespace"] = { link = "@namespace" },
        ["@lsp.type.parameter"] = { link = "@parameter" },
        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.variable"] = { link = "@variable" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        ["@lsp.typemod.variable.readonly"] = { link = "@constant" },
    }
end

return M
