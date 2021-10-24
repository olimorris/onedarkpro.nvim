local M = {}

M.themes = {
	"onedark",
	"onelight",
}

---Return color table based on the name provided
---@param name string
---@return table
function M.get_theme_colors(name)
	name = name or require("onedarkpro.config").options.theme

	if vim.tbl_contains(M.themes, name) then
		return require("onedarkpro.colors." .. name).load()
	end

	return require("onedarkpro.colors.onedark").load()
end

return M
