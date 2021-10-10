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
}

function M.set_options(opts)
	opts = opts or {}
	M.options = vim.tbl_deep_extend("force", {}, config, opts)
end

M.set_options(config)

return M
