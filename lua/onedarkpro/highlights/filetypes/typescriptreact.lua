local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        ["@function.tsx"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@function.call.tsx"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@parameter.tsx"] = { fg = theme.palette.red, style = config.options.italic },
        ["@punctuation.bracket.tsx"] = { fg = theme.palette.orange },
        ["@tag.attribute.tsx"] = { fg = theme.palette.orange, style = config.options.italic },
        ["@type.builtin.tsx"] = { fg = theme.palette.purple },
    }
end

return M
