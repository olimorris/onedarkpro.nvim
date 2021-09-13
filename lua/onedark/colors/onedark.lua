local utils = require("onedark.utils")

local M = {}

function M.init()

  local colors = {
      name              = "onedark",

      -- Core colors
      bg                = "#1E1E1E",
      fg                = "#abb2bf",
      red               = "#e06c75",
      green             = "#98C379",
      yellow            = "#ecbf6f",
      blue              = "#61afef",
      purple            = "#c678dd",
      cyan              = "#56b6c2",
      white             = "#abb2bf",
      black             = "#1E1E1E",
      gray              = "#4c4f55",
      highlight         = "#e2be7d",

      -- Unique colors that we need
      comment           = utils.lighten('#4c4f55', 0.8),   -- based on gray
      selection         = utils.lighten("#1E1E1E", 0.8),   -- based on bg
      color_column      = utils.lighten("#1E1E1E", 0.97),  -- based on bg
      indentline        = utils.lighten("#1E1E1E", 0.92),  -- based on bg
      menu              = utils.lighten('#1E1E1E', 0.85),  -- based on bg
      menu_scroll       = utils.lighten('#1E1E1E', 0.90),  -- based on bg
      menu_scroll_thumb = utils.darken("#118dc3", 0.80)    -- based on blue
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