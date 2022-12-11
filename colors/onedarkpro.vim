lua << EOF
if vim.fn.has("nvim-0.8") ~= 1 then
	local notify = require("onedarkpro.utils.notify")
	return notify:warn({"This plugin now requires Neovim 0.8 or higher", "Please use the `0.7` branch for compatibility"})
end

require("onedarkpro.utils.deprecate").write(
	"----------\n",
	"The use of: vim.cmd(\"colorscheme ",
	{ "onedarkpro", "ErrorMsg" },
	"\")\nPlease replace with one of: ",
	{ "'onedark'", "Title" },
	", ",
	{ "'onelight'", "Title" },
	", ",
	{ "'onedark_vivid'", "Title" },
	", or ",
	{ "'onedark_dark'", "Title" },
	" instead\nThis will be removed from the plugin on ",
	{ "2022-12-31", "WarningMsg" }
)

require("onedarkpro").load()
EOF
