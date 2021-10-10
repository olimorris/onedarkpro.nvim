local M = {}
M.options = {}

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
	highlight_cursorline = false -- Set the cursorline highlighting
}

function M.set_options(opts)
	opts = opts or {}
	M.options = vim.tbl_deep_extend("force", {}, config, opts)

	if M.options.highlight_cursorline then
		vim.wo.cursorline = true
	end
end

return M
