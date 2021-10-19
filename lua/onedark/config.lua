local utils = require("onedark.utils")
local M = {}

local config = {
	theme = "onedark", -- The theme to be used (opts: 'onedark' or 'onelight')
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
		terminal_colors = false, -- Use the 16 terminal colors instead?
		highlight_cursorline = false, -- Use cursorline highlighting?
	},
}

M.options = config

function M.set_options(opts)
	opts = opts or {}
	M.options = utils.tbl_deep_extend(M.options, opts)

	if M.options.highlight_cursorline then
		utils.warn(
			"`highlight_cursorline` has been moved into the options table of your config",
			"EXAMPLE: onedark.setup({ options = { highlight_cursorline = true } })",
			"See https://github.com/olimorris/onedarkpro.nvim for more info",
			"-----------------------------------------------------------------------------------"
		)
	end

	if M.options.options.highlight_cursorline then
		vim.wo.cursorline = true
	end
end

return M
