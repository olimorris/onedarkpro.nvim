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

function M.colorscheme_load(name)
	local colors = require("onedark.colors").load(name)
	local theme = require("onedark.theme").apply(colors)

	utils.load(theme, false)
end

return M
