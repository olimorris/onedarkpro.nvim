local M = {}
local colors = {}
local utils = require("onedarkpro.utils")

function M.load(config)
    local config = config or require("onedarkpro.config").config

    colors.name = "onedark"
    colors.style = "dark"
    M.base_colors()
    utils.color_overrides(colors, config)
    M.additional_colors()

    return colors
end

function M.base_colors()
    colors.bg = "#282c34"
    colors.fg = "#abb2bf"
    colors.red = "#e06c75"
    colors.orange = "#d19a66"
    colors.yellow = "#e5c07b"
    colors.green = "#98c379"
    colors.cyan = "#56b6c2"
    colors.blue = "#61afef"
    colors.purple = "#c678dd"
    colors.white = "#abb2bf"
    colors.black = "#282c34"
    colors.gray = "#5c6370"
    colors.highlight = "#e2be7d"
    colors.none = "NONE"

    return colors
end

function M.additional_colors()
    colors.cursorline = colors.cursorline or utils.lighten(colors.bg, 0.97)
    colors.color_column = colors.color_column or utils.lighten(colors.bg, 0.97)
    colors.indentline = colors.indentline or utils.lighten(colors.bg, 0.93)
    colors.selection = colors.selection or utils.lighten(colors.bg, 0.8)

    -- Git diff
    colors.diff_add = colors.diff_add or "#003e4a"
    colors.diff_delete = colors.diff_delete or "#501b20"
    colors.diff_text = colors.diff_text or "#005869"

    -- Lualine colors
    colors.bg_statusline = colors.bg_statusline or utils.lighten(colors.bg, 0.95)
    colors.fg_gutter = colors.fg_gutter or utils.lighten(colors.bg, 0.70)
    colors.fg_sidebar = colors.fg_sidebar or colors.fg

    -- Virtual text
    colors.virtual_text_error = colors.virtual_text_error or utils.lighten(colors.red, 0.7)
    colors.virtual_text_warning = colors.virtual_text_warning or utils.lighten(colors.yellow, 0.7)
    colors.virtual_text_information = colors.virtual_text_information or utils.lighten(colors.blue, 0.7)
    colors.virtual_text_hint = colors.virtual_text_hint or utils.lighten(colors.cyan, 0.8)

    return colors
end

return M
