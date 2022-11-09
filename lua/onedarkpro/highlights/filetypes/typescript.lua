local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        ["@function.typescript"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@function.call.typescript"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@method.typescript"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@method.call.typescript"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@parameter.typescript"] = { fg = theme.palette.red, style = config.options.italic },
        ["@punctuation.bracket.typescript"] = { fg = theme.palette.orange },
        ["@variable.typescript"] = { fg = theme.palette.red },
    }
end

return M
