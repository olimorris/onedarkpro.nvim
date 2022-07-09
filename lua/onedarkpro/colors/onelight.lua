local M = {}
local colors = {}
local utils = require("onedarkpro.utils")

function M.load(config)
    local config = config or require("onedarkpro.config").config

    colors.name = "onelight"
    colors.style = "light"
    M.base_colors()
    utils.color_overrides(colors, config)
    M.additional_colors()

    return colors
end

function M.base_colors()
    colors.bg = "#fafafa"
    colors.fg = "#6a6a6a"
    colors.red = "#e05661"
    colors.orange = "#ee9025"
    colors.yellow = "#eea825"
    colors.green = "#1da912"
    colors.cyan = "#56b6c2"
    colors.blue = "#118dc3"
    colors.purple = "#9a77cf"
    colors.white = "#fafafa"
    colors.black = "#6a6a6a"
    colors.gray = "#bebebe"
    colors.highlight = "#e2be7d"
    colors.none = "NONE"

    return colors
end

function M.additional_colors()
    colors.cursorline = colors.cursorline or utils.darken(colors.bg, 0.97)
    colors.color_column = colors.color_column or utils.darken(colors.bg, 0.97)
    colors.indentline = colors.indentline or utils.darken(colors.bg, 0.93)
    colors.selection = colors.selection or utils.darken(colors.bg, 0.90)

    -- Git diff
    colors.diff_add = colors.diff_add or "#cae3e8"
    colors.diff_delete = colors.diff_delete or "#f5c6c6"
    colors.diff_text = colors.diff_text or "#a6d0d8"

    -- Lualine colors
    colors.bg_statusline = colors.bg_statusline or utils.darken(colors.bg, 0.95)
    colors.fg_gutter = colors.fg_gutter or utils.darken(colors.bg, 0.70)
    colors.fg_sidebar = colors.fg_sidebar or colors.fg

    -- Virtual text
    colors.virtual_text_error = colors.virtual_text_error or utils.lighten(colors.red, 0.6)
    colors.virtual_text_warning = colors.virtual_text_warning or utils.lighten(colors.yellow, 0.6)
    colors.virtual_text_information = colors.virtual_text_information or utils.lighten(colors.blue, 0.6)
    colors.virtual_text_hint = colors.virtual_text_hint or utils.lighten(colors.cyan, 0.6)

    return colors
end

return M
