local meta = {
    name = "onelight",
    background = "light",
}

local default_colors = {
    bg = "#fafafa",
    fg = "#6a6a6a",
    red = "#e05661",
    orange = "#ee9025",
    yellow = "#eea825",
    green = "#1da912",
    cyan = "#56b6c2",
    blue = "#118dc3",
    purple = "#9a77cf",
    white = "#fafafa",
    black = "#6a6a6a",
    gray = "#bebebe",
    highlight = "#e2be7d",
    comment = "#9b9fa6",
    none = "NONE",
}

---Colors which are generated depending on the values in the palette
---@param colors table the theme's color palette
---@return table
local function generate(colors)
    local color = require("onedarkpro.helpers")

    return {
        cursorline = colors.cursorline or color.darken(colors.bg, 2.5),
        color_column = colors.color_column or color.darken(colors.bg, 3.2),
        fold = colors.fold or color.darken(colors.bg, 3),
        indentline = colors.indentline or color.darken(colors.bg, 7.3),
        selection = colors.selection or color.darken(colors.bg, 6.5),
        float_bg = colors.float_bg or color.darken(colors.bg, 4.5),

        -- Git diff
        diff_add = colors.diff_add or "#cae3e8",
        diff_delete = colors.diff_delete or "#f5c6c6",
        diff_text = colors.diff_text or "#a6d0d8",

        -- Lualine colors
        bg_statusline = colors.bg_statusline or color.darken(colors.bg, 2.6),
        fg_gutter = colors.fg_gutter or color.darken(colors.bg, 9.7),
        fg_gutter_inactive = colors.fg_gutter_inactive or colors.fg,

        -- Virtual text
        virtual_text_error = colors.virtual_text_error or color.lighten(colors.red, 15),
        virtual_text_warning = colors.virtual_text_warning or color.lighten(colors.yellow, 15),
        virtual_text_information = colors.virtual_text_information or color.lighten(colors.blue, 26),
        virtual_text_hint = colors.virtual_text_hint or color.lighten(colors.cyan, 15),
    }
end

return {
    meta = meta,
    palette = default_colors,
    generated = function()
        return generate(default_colors)
    end,
}
