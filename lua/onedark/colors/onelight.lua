local utils = require("onedark.utils")

local M = {}

function M.init()

  local colors = {
      name          = "onelight",

      bg            = "#fafafa",
      fg            = "#6a6a6a",

      red           = "#e05661",
      green         = "#1da912",
      yellow        = "#eea825",
      blue          = "#118dc3",
      purple        = "#9a77cf",
      cyan          = "#56B6C2",
      white         = "#fafafa",
      black         = "#6a6a6a",
      gray          = "#bebebe",
      
      highlight     = "#e2be7d",

      comment       = "#9a9a9a",
      selection     = "#bfceff",
      indentline    = "#d3d3d3",
      color_column  = "#f2f2f2",
      menu = utils.darken('#fafafa', 0.95),
      menu_scroll = utils.darken('#fafafa', 0.90),
      menu_scroll_thumb = "#118dc3"
  }

  return colors
end

function M.load(config)
  config = config or require("onedark.config").options

  local colors = M.init()
  utils.color_overrides(colors, config)

  return colors
end

return M