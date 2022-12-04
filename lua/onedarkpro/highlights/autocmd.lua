local M = {}

---Set the highlight groups for the editor
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config
    local autocmds = {}

    local autocmd = [[vim.cmd("autocmd %s %s %s")]]

    if config.options.highlight_inactive_windows or config.options.window_unfocused_color then
        local nc_highlights = "CursorLineNr:CursorLineNrNC,SignColumn:SignColumnNC,LineNr:LineNrNC,Folded:FoldedNC"
        local quickfix_nc_highlights =
            "CursorLineNr:CursorLineNrNCQuickFix,SignColumn:SignColumnNC,LineNr:LineNrNC,Folded:FoldedNC,QuickFixLine:QuickFixLineNC"

        table.insert(
            autocmds,
            string.format(
                autocmd,
                "WinEnter",
                "*",
                "if &buftype == 'quickfix' | set winhighlight-="
                    .. quickfix_nc_highlights
                    .. " | else | set winhighlight-="
                    .. nc_highlights
                    .. " | endif"
            )
        )
        table.insert(
            autocmds,
            string.format(
                autocmd,
                "WinLeave",
                "*",
                "if &buftype == 'quickfix' | set winhighlight+="
                    .. quickfix_nc_highlights
                    .. " | else | set winhighlight+="
                    .. nc_highlights
                    .. " | endif"
            )
        )
    end

    return autocmds
end

return M
