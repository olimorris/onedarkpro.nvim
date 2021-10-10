local utils = require("onedark.utils")

local M = {}

function M.load(config)
	config = config or require("onedark.config").options

	local colors = {
		name = "onedark",

		bg = "#1E1E1E",
		fg = "#abb2bf",
		red = "#e06c75",
		green = "#98C379",
		yellow = "#ecbf6f",
		blue = "#61afef",
		purple = "#c678dd",
		cyan = "#56b6c2",
		white = "#abb2bf",
		black = "#1E1E1E",
		gray = "#4c4f55",
		highlight = "#e2be7d",
	}

	-- Additional colors
	colors.cursorline = utils.lighten(colors.bg, 0.97)
	colors.comment = utils.lighten(colors.gray, 0.8)
	colors.selection = utils.lighten(colors.bg, 0.8)
	colors.color_column = utils.lighten(colors.bg, 0.97)
	colors.indentline = utils.lighten(colors.bg, 0.92)
	colors.menu = utils.lighten(colors.bg, 0.85)
	colors.menu_scroll = utils.lighten(colors.bg, 0.90)
	colors.menu_scroll_thumb = utils.darken(colors.blue, 0.80)

	utils.color_overrides(colors, config)

	-- Override the cursorline color if the option is not enabled
	if not config.highlight_cursorline then
		colors.cursorline = colors.bg
	end

	return colors
end

return M
