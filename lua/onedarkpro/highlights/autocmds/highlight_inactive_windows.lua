local M = {}

--- The autocmd for the file
---@param theme table
---@return table
function M.autocmd(theme)
    local nc_highlights = "CursorLineNr:CursorLineNrNC,SignColumn:SignColumnNC,LineNr:LineNrNC,Folded:FoldedNC"
    local quickfix_nc_highlights =
        "CursorLineNr:CursorLineNrNCQuickFix,SignColumn:SignColumnNC,LineNr:LineNrNC,Folded:FoldedNC,QuickFixLine:QuickFixLineNC"

    -- Return a table consisting of three elements:
    -- 1. The autocmd event
    -- 2. The autocmd pattern
    -- 3. The autocmd command
    return {
        {
            "WinEnter",
            "*",
            "if &buftype == 'quickfix' | set winhighlight-="
                .. quickfix_nc_highlights
                .. " | else | set winhighlight-="
                .. nc_highlights
                .. " | endif",
        },
        {
            "WinLeave",
            "*",
            "if &buftype == 'quickfix' | set winhighlight+="
                .. quickfix_nc_highlights
                .. " | else | set winhighlight+="
                .. nc_highlights
                .. " | endif",
        },
    }
end

return M
