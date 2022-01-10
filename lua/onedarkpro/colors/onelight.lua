local utils = require("onedarkpro.utils")

local M = {}

function M.load(config)
	local config = config or require("onedarkpro.config").config

	local colors = {
		name = "onelight",
		
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
		none = "NONE",
	}

	-- Additional colors
	colors.cursorline = utils.darken(colors.bg, 0.97)
	colors.comment = utils.darken(colors.gray, 0.80)
	colors.selection = utils.darken(colors.bg, 0.90)
	colors.color_column = utils.darken(colors.bg, 0.98)
	colors.indentline = utils.darken(colors.bg, 0.93)
	colors.menu = utils.darken(colors.bg, 0.95)
	colors.menu_scroll = utils.darken(colors.bg, 0.90)
	colors.menu_scroll_thumb = utils.lighten(colors.blue, 0.80)

	-- Git diff
	colors.diff_add = "#cae3e8"
	colors.diff_delete = "#f5c6c6"
	colors.diff_text = "#a6d0d8"

	-- Lualine colors
	colors.bg_statusline = utils.darken(colors.bg, 0.95)
	colors.fg_gutter = utils.darken(colors.bg, 0.90)
	colors.fg_sidebar = colors.fg

	-- Set the color table and include the users custom config
	utils.color_overrides(colors, config)

	return colors
end

return M
