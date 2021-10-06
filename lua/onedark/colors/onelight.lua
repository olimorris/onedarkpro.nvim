local utils = require("onedark.utils")

local M = {}

function M.init()
	local colors = {
		name = "onelight",

		-- Core colors
		bg = "#fafafa",
		fg = "#6a6a6a",
		red = "#e05661",
		green = "#1da912",
		yellow = "#eea825",
		blue = "#118dc3",
		purple = "#9a77cf",
		cyan = "#56b6c2",
		white = "#fafafa",
		black = "#6a6a6a",
		gray = "#bebebe",
		highlight = "#e2be7d",

		-- Unique colors that we need
		comment = utils.darken("#bebebe", 0.80), -- based on gray
		selection = utils.darken("#fafafa", 0.90), -- based on bg
		color_column = utils.darken("#fafafa", 0.98), -- based on bg
		indentline = utils.darken("#fafafa", 0.93), -- based on bg
		menu = utils.darken("#fafafa", 0.95), -- based on bg
		menu_scroll = utils.darken("#fafafa", 0.90), -- based on bg
		menu_scroll_thumb = utils.lighten("#118dc3", 0.80),  -- based on blue
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
