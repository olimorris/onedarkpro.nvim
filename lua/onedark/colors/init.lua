local M = {}

M.themes = {
	"onedark",
	"onelight",
}

-- Returns a color table based on the name provided
-- This returns the initial colors defined by the colorscheme without any
-- overrides from the config. Defaults to onedark
function M.init(name)
	name = name or require("onedark.config").options.theme

	if vim.tbl_contains(M.themes, name) then
		return require("onedark.colors." .. name).init()
	end

	return require("onedark.colors.onedark").init()
end

-- Return color table based on the name provided
-- If no name is provided then Onedark is returned
function M.load(name)
	name = name or require("onedark.config").options.theme

	if vim.tbl_contains(M.themes, name) then
		return require("onedark.colors." .. name).load()
	end

	return require("onedark.colors.onedark").load()
end

return M
