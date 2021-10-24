local utils = require("onedarkpro.utils")

local M = {}

---Set the config variables for the theme
---@param opts table
---@return table
function M.setup(opts)
	return require("onedarkpro.config").set_options(opts)
end

---Load the desired color groups with the theme
---@param name string
---@return table
function M.load(name)
	local colors = require("onedarkpro.colors").get_theme_colors(name)
	local theme = require("onedarkpro.theme").apply(colors)

	return utils.load(theme)
end

---Get the color table for a specific theme (e.g. onedark/onelight).
---@param name string
---@return table
function M.get_colors(name)
	return require("onedarkpro.colors").get_theme_colors(name)
end

return M
