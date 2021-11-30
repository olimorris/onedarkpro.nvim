local utils = require("onedarkpro.utils")
local M = {}

local config = {
	theme = function() -- The theme to be used (opts: 'onedark' or 'onelight')
		if vim.o.background == "dark" then
			return "onedark"
		else
			return "onelight"
		end
	end,
	colors = {}, -- Override default colors
	hlgroups = {}, -- Override default highlight groups
	styles = {
		strings = "NONE", -- Style that is applied to strings
		comments = "NONE", -- Style that is applied to comments
		keywords = "NONE", -- Style that is applied to keywords
		functions = "NONE", -- Style that is applied to functions
		variables = "NONE", -- Style that is applied to variables
	},
	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = true, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
		cursorline = false, -- Use cursorline highlighting?
		transparency = false, -- Use a transparent background?
		terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
		window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
	},
}

M.options = config

function M.set_options(opts)
	opts = opts or {}
	M.options = utils.tbl_deep_extend(M.options, opts)

	if M.options.options.highlight_cursorline or M.options.options.cursorline then
		vim.wo.cursorline = true
	end
end

return M
