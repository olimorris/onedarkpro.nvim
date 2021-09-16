local M = {}
M.options = {}

local config = {
	theme = "onedark", -- Which theme out of 'onedark' or 'onelight' should be used
	styles = {
		comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
		functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
		keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
		strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
		variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
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
