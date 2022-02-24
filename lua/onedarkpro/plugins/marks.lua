local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- https://github.com/chentau/marks.nvim/blob/555e8265989aa13249e76fd229226fb74101f905/doc/marks-nvim.txt#L278
        MarkSignHL = {
            fg = theme.colors.purple,
            bg = "NONE",
            style = theme.options.bold,
        },
        -- MarkSignNumHL = {  },
        MarkVirtTextHL = { fg = theme.colors.gray, style = theme.options.italic },
    }
end

return M
