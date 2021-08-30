local utils = require("onedark.utils")

local M = {}

function M.init()

  local colors = {
      name          = "onedark",

      bg            = "#1E1E1E",
      fg            = "#abb2bf",

      red           = "#e06c75",
      green         = "#98C379",
      yellow        = "#ecbf6f",
      blue          = "#61afef",
      purple        = "#c678dd",
      cyan          = "#56b6c2",
      white         = "#abb2bf",
      black         = "#1E1E1E",
      gray          = "#4c4f55",
      
      highlight     = "#e2be7d",

      comment       = "#7e848f",
      selection     = "#3e4452",
      indentline    = "#3a4049",
      color_column  = "#232323",
      menu = utils.lighten('#1E1E1E', 0.85),
      menu_scroll = utils.lighten('#1E1E1E', 0.90),
      menu_scroll_thumb = "#61afef"
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