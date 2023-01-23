local meta = {
    name = "onedark_dark",
    background = "dark",
}

local default_colors = {
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
---@param colors table the theme's color palette
---@return table
local function generate(colors)
    local color = require("onedarkpro.helpers")

    return {
        cursorline = colors.cursorline or color.lighten(colors.bg, 9),
        color_column = colors.color_column or color.lighten(colors.bg, 8.8),
        fold = colors.fold or color.lighten(colors.bg, 3),
        indentline = colors.indentline or color.lighten(colors.bg, 12),
        selection = colors.selection or color.lighten(colors.bg, 13),
        float_bg = colors.float_bg or color.darken(colors.bg, 3),

        -- Git colors
        git_add = colors.git_add or "#109868",
        git_modify = colors.git_modify or "#948b60",
        git_delete = colors.git_delete or "#9a353d",

        -- Git diff
        diff_add = colors.diff_add or "#003e4a",
        diff_delete = colors.diff_delete or "#501b20",
        diff_text = colors.diff_text or "#005869",

        -- Lualine colors
        bg_statusline = colors.bg_statusline or color.lighten(colors.bg, 5.3),
        fg_gutter = colors.fg_gutter or color.lighten(colors.bg, 9.5),
        fg_gutter_inactive = colors.fg_gutter_inactive or colors.fg,

        -- Virtual text
        virtual_text_error = colors.virtual_text_error or color.lighten(colors.red, 9.3),
        virtual_text_warning = colors.virtual_text_warning or color.lighten(colors.yellow, 9),
        virtual_text_information = colors.virtual_text_information or color.lighten(colors.blue, 10.2),
        virtual_text_hint = colors.virtual_text_hint or color.lighten(colors.cyan, 10.8),
    }
end

return {
    meta = meta,
    palette = default_colors,
    generated = function()
        return generate(default_colors)
    end,
}
