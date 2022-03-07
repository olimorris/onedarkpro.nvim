local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        BufferCurrent = {
            fg = theme.colors.purple,
            bg = theme.options.transparency,
        },
        BufferCurrentIndex = { link = "BufferCurrent" },
        BufferCurrentMod = { fg = theme.colors.purple },
        BufferCurrentSign = { link = "BufferCurrentMod" },
        BufferCurrentIcon = { link = "BufferCurrentMod" },
        BufferCurrentTarget = {
            bg = theme.options.transparency,
            fg = theme.colors.blue,
            style = theme.options.bold,
        },
        BufferVisible = { fg = theme.colors.gray },
        BufferVisibleIndex = { link = "BufferVisible" },
        BufferVisibleMod = { link = "BufferVisible" },
        BufferVisibleSign = { link = "BufferVisibleMod" },
        BufferVisibleIcon = { link = "BufferVisibleMod" },
        BufferVisibleTarget = { link = "BufferCurrentTarget" },
        BufferInactive = { link = "BufferVisible" }, -- Buffer which is not active
        BufferInactiveIndex = { link = "BufferInactive" },
        BufferInactiveMod = { link = "BufferInactive" },
        BufferInactiveSign = { fg = theme.colors.bg }, -- The inactive sign of a buffer
        BufferInactiveTarget = { link = "BufferCurrentTarget" },
        BufferTabpages = { fg = theme.colors.purple }, -- The tab page indicator on the right
        BufferTabpageFill = { fg = theme.colors.bg }, -- The sign which marks the end of the bufferline
    }
end

return M
