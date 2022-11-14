local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@param config table
---@return table
function M.groups(theme, config)
    return {
        ["@constant.builtin.rust"] = { fg = theme.palette.cyan },
        ["@field.rust"] = { fg = theme.palette.red },
        ["@function.builtin.rust"] = { fg = theme.palette.cyan },
        ["@function.macro.rust"] = { fg = theme.palette.orange },
        ["@keyword.rust"] = { fg = theme.palette.purple },
        ["@label.rust"] = { fg = theme.palette.white },
        ["@operator.rust"] = { fg = theme.palette.fg },
        ["@parameter.rust"] = { fg = theme.palette.red, style = config.options.italic },
        ["@storageclass.rust"] = { link = '@keyword' },
    }
end

return M
