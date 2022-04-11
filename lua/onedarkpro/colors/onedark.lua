local utils = require("onedarkpro.utils")

local M = {}

function M.load(config)
    local config = config or require("onedarkpro.config").config

    local colors = {
        name = "onedark",

        bg = "#282c34",
        fg = "#abb2bf",
        red = "#e06c75",
        orange = "#d19a66",
        yellow = "#e5c07b",
        green = "#98c379",
        cyan = "#56b6c2",
        blue = "#61afef",
        purple = "#c678dd",
        white = "#abb2bf",
        black = "#282c34",
        gray = "#5c6370",
        highlight = "#e2be7d",
        none = "NONE",
    }

    -- Set the color table and include the users custom config
    utils.color_overrides(colors, config)

    -- Additional colors
    colors.cursorline = colors.cursorline or utils.lighten(colors.bg, 0.97)
    colors.color_column = colors.color_column or utils.lighten(colors.bg, 0.97)
    colors.comment = colors.comment or utils.lighten(colors.gray, 0.80)
    colors.indentline = colors.indentline or utils.lighten(colors.bg, 0.93)
    colors.menu = colors.menu or utils.lighten(colors.bg, 0.90)
    colors.menu_scroll = colors.menu_scroll or utils.lighten(colors.bg, 0.95)
    colors.menu_scroll_thumb = colors.menu_scroll_thumb or utils.darken(colors.blue, 0.80)
    colors.selection = colors.selection or utils.lighten(colors.bg, 0.8)

    -- Git diff
    colors.diff_add = colors.diff_add or "#003e4a"
    colors.diff_delete = colors.diff_delete or "#501b20"
    colors.diff_text = colors.diff_text or "#005869"

    -- Lualine colors
    colors.bg_statusline = colors.bg_statusline or utils.lighten(colors.bg, 0.95)
    colors.fg_gutter = colors.fg_gutter or utils.lighten(colors.bg, 0.70)
    colors.fg_sidebar = colors.fg_sidebar or colors.fg

    return colors
end

return M
