local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme, config)
    return {
        ["@function.ruby"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@function.call.ruby"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@include.ruby"] = { fg = theme.palette.blue, style = config.options.italic },
        ["@label.ruby"] = { fg = theme.palette.red },
        ["@parameter.ruby"] = { fg = theme.palette.fg, style = config.options.italic },
        ["@punctuation.bracket.ruby"] = { fg = theme.palette.yellow },
        ["@symbol.ruby"] = { fg = theme.palette.cyan },
    }
end

return M
