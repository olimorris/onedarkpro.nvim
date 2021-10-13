local utils = require("onedark.utils")
local M = {}

local config = {
	theme = "onedark", -- Which theme out of 'onedark' or 'onelight' should be used
	styles = {
		comments = "NONE", -- Style that is applied to comments
		functions = "NONE", -- Style that is applied to functions
		keywords = "NONE", -- Style that is applied to keywords
		strings = "NONE", -- Style that is applied to strings
		variables = "NONE", -- Style that is applied to variables
	},
	colors = {}, -- Override default colors
	hlgroups = {}, -- Override default highlight groups
	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = true, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
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
			"onedark.setup({ options = { highlight_cursorline = true } }) should now be called",
			"See https://github.com/olimorris/onedark.nvim for more info"
		)
	end

	if M.options.options.highlight_cursorline then
		vim.wo.cursorline = true
	end
end

return M
