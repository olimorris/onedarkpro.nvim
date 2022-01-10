local M = {}

-- Default options for the theme
M.config = {
	-- This enables the Neovim background to set either onedark or onelight
	theme = function()
		if vim.o.background == "dark" then
			return "onedark"
		else
			return "onelight"
		end
	end,
	colors = {}, -- Override default colors
	hlgroups = {}, -- Override default highlight groups
	plugins = { -- Enable/Disable specific plugins
		aerial = true,
		barbar = true,
		dashboard = true,
		gitsigns_nvim = true,
		hop = true,
		indentline = true,
		lsp_saga = true,
		marks = true,
		native_lsp = true,
		nvim_cmp = true,
		nvim_dap = true,
		nvim_dap_ui = true,
		nvim_hlslens = true,
		nvim_tree = true,
		nvim_ts_rainbow = true,
		packer = true,
		polygot = true,
		startify = true,
		telescope = true,
		toggleterm = true,
		treesitter = true,
		trouble_nvim = true,
		vim_ultest = true,
		which_key_nvim = true,
	},
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

---Apply the users custom config on top of the default
---@param user_config table
---@return nil
function M.set_config(user_config)
	local utils = require("onedarkpro.utils")

	-- Merge the config tables
	user_config = user_config or {}
	M.config = utils.tbl_deep_extend(M.config, user_config)

	-- Enable the cursorline in Neovim
	if M.config.options.highlight_cursorline or M.config.options.cursorline then
		vim.wo.cursorline = true
	end
end

return M
