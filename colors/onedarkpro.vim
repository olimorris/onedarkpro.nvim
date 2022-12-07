lua << EOF
if vim.fn.has("nvim-0.8") ~= 1 then
	local notify = require("onedarkpro.utils.notify")
	return notify:warn({"This plugin now requires Neovim 0.8 or higher", "Please use the `0.7` branch for compatibility"})
end

--TODO: Deprecate this file and ask a user to call onedark, onelight etc
require("onedarkpro").load()
EOF
