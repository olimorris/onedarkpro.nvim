local M = {}

--[[
	As onedark.nvim has been renamed to OneDarkPro.nvim, it felt odd not to
	change the naming in the configuration. For existing users, this would
	break their setups. To work around this, we keep this file in place
	and point to the OneDarkPro functions instead.
]]

function M.setup(opts)
	return require("onedarkpro").setup(opts)
end
function M.load(name)
	return require("onedarkpro").load(name)
end
function M.get_colors(name)
	return require("onedarkpro").get_colors(name)
end

return M
