local utils = require("onedarkpro.utils")

local M = {}

-- Set the config variables for the theme
function M.setup(opts)
	require("onedarkpro.config").set_options(opts)
end

-- Apply the theme colors and set the highlight groups
function M.load(name)
	local colors = require("onedarkpro.colors").get_theme_colors(name)
	local theme = require("onedarkpro.theme").apply(colors)

	utils.load(theme)
end

-- Helper function
-- Get the color table for a specific theme (e.g. onedark/onelight). This is 
-- useful when you wish to format a plugin with the same colors as the theme
function M.get_colors(name)
	return require("onedarkpro.colors").get_theme_colors(name)
end

return M
