local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- https://github.com/phaazon/hop.nvim/blob/e3c9fc3ab1e1db6bfb4f19377c53d0e457e0e2e9/doc/hop.txt#L759
        HopNextKey = { bg = theme.colors.green, fg = theme.colors.bg },
        HopNextKey1 = { bg = theme.colors.yellow, fg = theme.colors.bg },
        HopNextKey2 = { link = "HopNextKey1" },
        HopUnmatched = { fg = theme.colors.gray },
        HopCursor = { link = "Cursor" },
    }
end

return M
