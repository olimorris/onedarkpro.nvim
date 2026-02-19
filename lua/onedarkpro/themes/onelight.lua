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
    line_number = colors.line_number or color.darken(colors.bg, 18),
    indentline = colors.indentline or color.darken(colors.bg, 7.3),
    selection = colors.selection or color.darken(colors.bg, 6.5),
    float_bg = colors.float_bg or color.darken(colors.bg, 4.5),
    inlay_hint = colors.inlay_hint or color.lighten(colors.gray, 10),

    -- Git colors (for sign column)
    git_add = colors.git_add or color.lighten(colors.green, 35),
    git_change = colors.git_change or color.lighten(colors.yellow, 30),
    git_delete = colors.git_delete or color.lighten(colors.red, 35),

    -- Diff colors (for diff mode backgrounds)
    diff_add = colors.diff_add or color.blend(colors.bg, colors.green, 0.12),
    diff_change = colors.diff_change or color.blend(colors.bg, colors.yellow, 0.10),
    diff_delete = colors.diff_delete or color.blend(colors.bg, colors.red, 0.12),
    diff_text = colors.diff_text or color.blend(colors.bg, colors.cyan, 0.25),
    diff_text_delete = colors.diff_text_delete or color.blend(colors.bg, colors.red, 0.25),

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
