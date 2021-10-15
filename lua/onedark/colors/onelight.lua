local utils = require("onedark.utils")

local M = {}

function M.load(config)
	local config = config or require("onedark.config").options

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

	utils.color_overrides(colors, config)

	-- Override the cursorline color if the option is not enabled
	if not config.options.highlight_cursorline then
		colors.cursorline = colors.bg
	end

	return colors
end

return M
