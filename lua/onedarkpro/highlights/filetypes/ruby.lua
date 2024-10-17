local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        ["@constant.builtin.ruby"] = { fg = theme.palette.orange },
        ["@function.ruby"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@function.call.ruby"] = { fg = theme.palette.blue, style = config.styles.functions },
        ["@include.ruby"] = { fg = theme.palette.blue, style = config.styles.keywords },
        ["@keyword.function.ruby"] = { link = "@keyword.ruby" },
        ["@label.ruby"] = { fg = theme.palette.red },
        ["@parameter.ruby"] = { fg = theme.palette.fg, style = config.styles.parameters },
        ["@punctuation.bracket.ruby"] = { fg = theme.palette.orange },
        ["@symbol.ruby"] = { fg = theme.palette.cyan },

        ["@odp.colon.ruby"] = { fg = theme.palette.orange },
        ["@odp.pipe.ruby"] = { fg = theme.palette.fg },
        ["@odp.puts.ruby"] = { fg = theme.palette.cyan },
    }
end

return M
