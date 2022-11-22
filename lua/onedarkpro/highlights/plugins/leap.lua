local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    -- https://github.com/ggandor/leap.nvim/blob/a9d3232b178fddabb6660dc19abf40e05d6841b0/doc/leap.txt#L344-L386
    return {
        LeapMatch = { bg = theme.palette.purple, fg = theme.palette.bg },
        LeapLabelPrimary = { bg = theme.palette.green, fg = theme.palette.bg },
        LeapLabelSecondary = { bg = theme.palette.cyan, fg = theme.palette.bg },
        LeapLabelSelected = { bg = theme.palette.orange, fg = theme.palette.bg },
    }
end

return M
