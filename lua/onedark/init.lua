local utils = require("onedark.utils")

local M = {}

-- Set the config variables for the theme
function M.setup(opts)
	require("onedark.config").set_options(opts)
end

-- Apply the theme colors and set the highlight groups
function M.load(name)
	local colors = require("onedark.colors").load(name)
	local theme = require("onedark.theme").apply(colors)

	utils.load(theme, true)
end

-- Helper function
-- Get the color table for a specific theme (e.g. onedark/onelight). This is 
-- useful when you wish to format a plugin with the same colors as the theme
function M.get_colors(name)
	return require("onedark.colors").load(name)
end

return M
