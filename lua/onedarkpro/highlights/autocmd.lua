local M = {}

---Set the highlight groups for the editor
---@param theme table
---@return table
function M.groups(theme)
    local autocmd = [[vim.cmd("autocmd %s * %s")]]
    local nc_highlights = "CursorLineNr:CursorLineNrNC,SignColumn:SignColumnNC,LineNr:LineNrNC,Folded:FoldedNC"
    local quickfix_nc_highlights =
        "CursorLineNr:CursorLineNrNCQuickFix,SignColumn:SignColumnNC,LineNr:LineNrNC,Folded:FoldedNC,QuickFixLine:QuickFixLineNC"

    local autocmds = { [[
vim.cmd("augroup Onedarkpro")
vim.cmd("au!")
    ]] }

    table.insert(
        autocmds,
        string.format(
            autocmd,
            "WinEnter",
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
            "if &buftype == 'quickfix' | set winhighlight+="
                .. quickfix_nc_highlights
                .. " | else | set winhighlight+="
                .. nc_highlights
                .. " | endif"
        )
    )

    table.insert(autocmds, [[vim.cmd("augroup END")]])

    return autocmds
end

return M
