local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@function.ruby"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@function.call.ruby"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@include.ruby"] = { fg = theme.palette.blue, style = config.styles.keywords },
        ["@label.ruby"] = { fg = theme.palette.red },
        ["@parameter.ruby"] = { fg = theme.palette.fg, style = config.styles.parameters },
        ["@punctuation.bracket.ruby"] = { fg = theme.palette.yellow },
        ["@symbol.ruby"] = { fg = theme.palette.cyan },
    }
end

return M
