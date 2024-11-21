local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@function.tsx"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@function.call.tsx"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@parameter.tsx"] = { fg = theme.palette.red, style = config.styles.parameters },
        ["@punctuation.bracket.tsx"] = { fg = theme.palette.orange },
        ["@tag.attribute.tsx"] = { fg = theme.palette.orange },
        ["@type.builtin.tsx"] = { fg = theme.palette.purple },
    }
end

return M
