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

	utils.load(theme)
end

-- Use a command to load a specific theme color
function M.load_complete(lead, _, _)
	local colors = require("onedark.colors").themes

	if lead == "" then
		return colors
	end

	local completion_list = {}
	for _, name in pairs(colors) do
		if vim.startswith(name, lead) then
			table.insert(completion_list, name)
		end
	end

	return completion_list
end

return M
