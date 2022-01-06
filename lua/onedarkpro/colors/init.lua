local M = {}

M.themes = {
	"onedark",
	"onelight",
}

---Return the color table for one of the two themes
---@param name string
---@return table
function M.get_theme_colors(name)
	-- require("onedarkpro.utils").print_table(require("onedarkpro.config").config.theme)
	name = name or require("onedarkpro.config").config.theme

	if type(name) == "function" then
		name = name()
	end

	if vim.tbl_contains(M.themes, name) then
		return require("onedarkpro.colors." .. name).load()
	end

	return require("onedarkpro.colors.onedark").load()
end

return M
