local utils = require("onedarkpro.utils")

local M = {}

function M.load(config)
	local config = config or require("onedarkpro.config").config

	local colors = {
		name = "onedark",

		bg = "#1e1e1e",
		fg = "#abb2bf",
		red = "#e06c75",
		orange = "#d19a66",
		yellow = "#e5c07b",
		green = "#98c379",
		cyan = "#56b6c2",
		blue = "#61afef",
		purple = "#c678dd",
		white = "#abb2bf",
		black = "#1e1e1e",
		gray = "#5c6370",
		highlight = "#e2be7d",
		none = "NONE",
	}

	-- Additional colors
	colors.color_column = utils.lighten(colors.bg, 0.97)
	colors.comment = utils.lighten(colors.gray, 0.8)
	colors.cursorline = utils.lighten(colors.bg, 0.97)
	colors.indentline = utils.lighten(colors.bg, 0.92)
	colors.menu = utils.lighten(colors.bg, 0.90)
	colors.menu_scroll = utils.lighten(colors.bg, 0.95)
	colors.menu_scroll_thumb = utils.darken(colors.blue, 0.80)
	colors.selection = utils.lighten(colors.bg, 0.8)

	-- Git diff
	colors.diff_add = "#003e4a"
	colors.diff_delete = "#501b20"
	colors.diff_text = "#005869"

	-- Lualine colors
	colors.bg_statusline = utils.lighten(colors.bg, 0.95)
	colors.fg_gutter = utils.lighten(colors.bg, 0.90)
	colors.fg_sidebar = colors.fg

	-- Set the color table and include the users custom config
	utils.color_overrides(colors, config)

	return colors
end

return M
