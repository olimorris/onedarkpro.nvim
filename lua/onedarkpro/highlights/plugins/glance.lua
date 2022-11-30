local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local color = require("onedarkpro.lib.color")
    local config = require("onedarkpro.config").config

    return {
        GlancePreviewNormal = {
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.85)
                or color.darken(theme.palette.bg, 0.98),
        },
        GlancePreviewMatch = { link = "Search" },
        -- GlancePreviewCursorLine = { fg = theme.palette.red },
        GlancePreviewSignColumn = {
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.85)
                or color.darken(theme.palette.bg, 0.98),
        },
        GlancePreviewEndOfBuffer = {
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.75)
                or color.darken(theme.palette.bg, 0.93),
        },
        GlancePreviewLineNr = {
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.85)
                or color.darken(theme.palette.bg, 0.98),
        },

        GlanceFoldIcon = {
            fg = theme.generated.indentline,
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.7)
                or color.darken(theme.palette.bg, 0.95),
        },

        GlanceIndent = {
            fg = theme.generated.indentline,
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.7)
                or color.darken(theme.palette.bg, 0.95),
        },
        GlanceListCount = { fg = theme.palette.purple },
        GlanceListNormal = {
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.7)
                or color.darken(theme.palette.bg, 0.95),
        },
        GlanceListMatch = { link = "Search" },
        GlanceListEndOfBuffer = {
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.75)
                or color.darken(theme.palette.bg, 0.93),
        },

        GlanceWinBarTitle = {
            fg = theme.palette.purple,
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.6)
                or color.darken(theme.palette.bg, 0.91),
            style = config.options.bold,
        },
        GlanceWinBarFilename = {
            fg = theme.palette.blue,
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.6)
                or color.darken(theme.palette.bg, 0.91),
            style = config.options.italic,
        },
        GlanceWinBarFilepath = {
            fg = theme.meta.background == "dark" and theme.palette.gray or theme.palette.fg,
            bg = theme.meta.background == "dark" and color.darken(theme.palette.bg, 0.6)
                or color.darken(theme.palette.bg, 0.91),
        },
    }
end

return M
