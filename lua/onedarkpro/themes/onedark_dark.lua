local meta = {
    name = "onedark_dark",
    background = "dark"
}

local palette = {
    bg = "#000000",
    fg = "#abb2bf",
    red = "#ef596f",
    orange = "#d19a66",
    yellow = "#e5c07b",
    green = "#89ca78",
    cyan = "#2bbac5",
    blue = "#61afef",
    purple = "#d55fde",
    white = "#abb2bf",
    black = "#000000",
    gray = "#434852",
    highlight = "#e2be7d",
    comment = "#7f848e",
    none = "NONE",
}

---Colors which are generated depending on the values in the palette
---@param palette table the theme's color palette
---@return table
local function generate(palette)
    local color = require("onedarkpro.lib.color")

    return {
        cursorline = palette.cursorline or color.lighten(palette.bg, 0.97),
        color_column = palette.color_column or color.lighten(palette.bg, 0.97),
        indentline = palette.indentline or color.lighten(palette.bg, 0.93),
        selection = palette.selection or color.lighten(palette.bg, 0.8),
        float_bg = palette.float_bg or color.lighten(palette.bg, 0.97),

        -- Git diff
        diff_add = palette.diff_add or "#003e4a",
        diff_delete = palette.diff_delete or "#501b20",
        diff_text = palette.diff_text or "#005869",

        -- Lualine colors
        bg_statusline = palette.bg_statusline or color.lighten(palette.bg, 0.95),
        fg_gutter = palette.fg_gutter or color.lighten(palette.bg, 0.70),

        -- Virtual text
        virtual_text_error = palette.virtual_text_error or color.lighten(palette.red, 0.7),
        virtual_text_warning = palette.virtual_text_warning or color.lighten(palette.yellow, 0.7),
        virtual_text_information = palette.virtual_text_information or color.lighten(palette.blue, 0.7),
        virtual_text_hint = palette.virtual_text_hint or color.lighten(palette.cyan, 0.8),
    }
end

return {
    meta = meta,
    palette = palette,
    generated = function(palette)
        return generate(palette)
    end,
}
