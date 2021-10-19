--[[
Borrowed from https://github.com/EdenEast/nightfox.nvim
]]

local hsluv = require("onedark.hsluv")

local utils = {}

utils.bg = "#000000"
utils.fg = "#ffffff"
utils.day_brightness = 0.3

function utils.warn(...)
	for _, msg in ipairs({ ... }) do
		vim.cmd('echohl WarningMsg | echom "Onedark.nvim: ' .. msg .. '" | echohl NONE')
	end
end

local hex_to_rgb = function(hex_str)
	local hex = "[abcdef0-9][abcdef0-9]"
	local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
	hex_str = string.lower(hex_str)

	assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

	local r, g, b = string.match(hex_str, pat)
	return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function utils.blend(fg, bg, alpha)
	bg = hex_to_rgb(bg)
	fg = hex_to_rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function utils.darken(hex, amount, bg)
	return utils.blend(hex, bg or utils.bg, math.abs(amount))
end

function utils.lighten(hex, amount, fg)
	return utils.blend(hex, fg or utils.fg, math.abs(amount))
end

function utils.invertColor(color)
	if color ~= "NONE" then
		local hsl = hsluv.hex_to_hsluv(color)
		hsl[3] = 100 - hsl[3]
		if hsl[3] < 40 then
			hsl[3] = hsl[3] + (100 - hsl[3]) * utils.day_brightness
		end
		return hsluv.hsluv_to_hex(hsl)
	end
	return color
end

-- Merge multiple tables together
function utils.tbl_deep_extend(...)
	local lhs = {}
	for _, rhs in ipairs({ ... }) do
		for k, v in pairs(rhs) do
			if type(lhs[k]) == "table" and type(v) == "table" then
				lhs[k] = utils.tbl_deep_extend(lhs[k], v)
			else
				lhs[k] = v
			end
		end
	end
	return lhs
end

function utils.color_overrides(colors, config)
	if type(config.colors) == "table" then
		for key, value in pairs(config.colors) do
			if not colors[key] then
				error("Color " .. key .. " does not exist")
			end

			-- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
			if type(colors[key]) == "table" then
				utils.color_overrides(colors[key], { colors = value })
			else
				if value:lower() == "none" then
					-- set to none
					colors[key] = "NONE"
				elseif string.sub(value, 1, 1) == "#" then
					-- hex override
					colors[key] = value
				else
					-- another group
					if not colors[value] then
						error("Color " .. value .. " does not exist")
					end
					colors[key] = colors[value]
				end
			end
		end
	end
end

function utils.highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

	vim.cmd(hl)

	if color.link and (color.fg == nil and color.bg == nil and color.sg == nil) then
		vim.cmd("highlight! link " .. group .. " " .. color.link)
	end
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function utils.template(str, table)
	return (str:gsub("($%b{})", function(w)
		return table[w:sub(3, -2)] or w
	end))
end

-- Template values in a table recursivly
---@param table table the table to be replaced
---@param values table the values to be replaced by the template strings in the table passed in
function utils.template_table(table, values)
	-- if the value passed is a string the return templated resolved string
	if type(table) == "string" then
		return utils.template(table, values)
	end

	-- If the table passed in is a table then iterate though the children and call template table
	for key, value in pairs(table) do
		table[key] = utils.template_table(value, values)
	end

	return table
end

function utils.set_syntax(tbl)
	for group, colors in pairs(tbl) do
		utils.highlight(group, colors)
	end
end

function utils.terminal(theme)
	vim.g.terminal_color_0 = theme.colors.black
	vim.g.terminal_color_1 = theme.colors.red
	vim.g.terminal_color_2 = theme.colors.green
	vim.g.terminal_color_3 = theme.colors.yellow
	vim.g.terminal_color_4 = theme.colors.blue
	vim.g.terminal_color_5 = theme.colors.purple
	vim.g.terminal_color_6 = theme.colors.cyan
	vim.g.terminal_color_7 = theme.colors.white

	vim.g.terminal_color_8 = theme.colors.black
	vim.g.terminal_color_9 = theme.colors.red
	vim.g.terminal_color_10 = theme.colors.green
	vim.g.terminal_color_11 = theme.colors.yellow
	vim.g.terminal_color_12 = theme.colors.blue
	vim.g.terminal_color_13 = theme.colors.purple
	vim.g.terminal_color_14 = theme.colors.cyan
	vim.g.terminal_color_15 = theme.colors.white
end

function utils.load(theme)
	-- Prevent double loading the theme
	if vim.g.loaded_onedark == theme.colors.name then
		return
	end

	-- Clear all highlights from other color schemes
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "onedark" -- We technically only have the one theme so this must be hardcoded as onedark

	-- Replace color variables in the user's custom hlgroups
	local hlgroups = utils.template_table(theme.config.hlgroups, theme.colors)

	--[[
	Due to recent configuration changes, we need to check if the user is using
	the "link =" annotations correcrtly. If not, warn them accordingly
	]]
	local warn = 0
	for _, colors in pairs(hlgroups) do
		for key, _ in pairs(colors) do
			if key ~= "fg" and key ~= "bg" and key ~= "sp" and key ~= "style" and key ~= "link" then
				warn = warn + 1
			end
		end
	end
	if warn > 0 then
		utils.warn(
			"Directly referencing highlight groups has now changed. Please use the `link` keyword",
			"EXAMPLE: onedark.setup({ hlgroups = { ModeMsg = { link = 'LineNr' } } })",
			"See https://github.com/olimorris/onedarkpro.nvim for more info",
			"-----------------------------------------------------------------------------------"
		)
	end

	-- Merge the user's custom hlgroups with the theme's
	local groups = utils.tbl_deep_extend(theme.groups, hlgroups)

	utils.set_syntax(groups)

	if theme.config.options.terminal_colors then
		utils.terminal(theme)
	end

	-- Set the global load variable and trigger the colorscheme autocommand
	vim.g.loaded_onedark = theme.colors.name
	vim.cmd([[doautocmd ColorScheme]])
end

return utils
