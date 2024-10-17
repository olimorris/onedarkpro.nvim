local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        BufferCurrent = {
            fg = theme.palette.purple,
            bg = config.options.transparency and "NONE" or theme.palette.bg,
        },
        BufferCurrentIndex = { link = "BufferCurrent" },
        BufferCurrentMod = { fg = theme.palette.purple },
        BufferCurrentSign = { link = "BufferCurrentMod" },
        BufferCurrentIcon = { link = "BufferCurrentMod" },
        BufferCurrentTarget = {
            bg = config.options.transparency and "NONE" or theme.palette.bg,
            fg = theme.palette.blue,
        },
        BufferVisible = { fg = theme.palette.gray },
        BufferVisibleIndex = { link = "BufferVisible" },
        BufferVisibleMod = { link = "BufferVisible" },
        BufferVisibleSign = { link = "BufferVisibleMod" },
        BufferVisibleIcon = { link = "BufferVisibleMod" },
        BufferVisibleTarget = { link = "BufferCurrentTarget" },
        BufferInactive = { link = "BufferVisible" }, -- Buffer which is not active
        BufferInactiveIndex = { link = "BufferInactive" },
        BufferInactiveMod = { link = "BufferInactive" },
        BufferInactiveSign = { fg = theme.palette.bg }, -- The inactive sign of a buffer
        BufferInactiveTarget = { link = "BufferCurrentTarget" },
        BufferTabpages = { fg = theme.palette.purple }, -- The tab page indicator on the right
        BufferTabpageFill = { fg = theme.palette.bg }, -- The sign which marks the end of the bufferline
    }
end

return M
