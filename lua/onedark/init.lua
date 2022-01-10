local M = {}
local utils = require("onedarkpro.utils")

--[[
	As onedark.nvim has been renamed to OneDarkPro.nvim, it felt odd not to
	change the naming in the configuration. For existing users, this would
	break their setups. To work around this, we keep this file in place
	and point to the OneDarkPro functions instead.
]]

function M.setup(user_config)
	utils.warn(
		"Please reference `onedarkpro` instead of `onedark` in your config",
		"This will be removed in the next update"
	)
	return require("onedarkpro").setup(user_config)
end
function M.load(name)
	utils.warn(
		"Please reference `onedarkpro` instead of `onedark` in your config",
		"This will be removed in the next update"
	)
	return require("onedarkpro").load(name)
end
function M.get_colors(name)
	utils.warn(
		"Please reference `onedarkpro` instead of `onedark` in your config",
		"This will be removed in the next update"
	)
	return require("onedarkpro").get_colors(name)
end

return M
