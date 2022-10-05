local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@function.ruby"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@function.call.ruby"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@include.ruby"] = { fg = theme.palette.blue, style = config.options.italic },
        ["@parameter.ruby"] = { fg = theme.palette.fg, style = config.options.italic },
        ["@symbol.ruby"] = { fg = theme.palette.cyan },
    }
end

return M
