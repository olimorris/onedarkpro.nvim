--[[
Borrowed from https://github.com/EdenEast/nightfox.nvim
]]

local hsluv = require("onedark.hsluv")

local util = {}

util.bg = "#000000"
util.fg = "#ffffff"
util.day_brightness = 0.3

function util.warn(...)
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
function util.blend(fg, bg, alpha)
	bg = hex_to_rgb(bg)
	fg = hex_to_rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg)
	return util.blend(hex, bg or util.bg, math.abs(amount))
end

function util.lighten(hex, amount, fg)
	return util.blend(hex, fg or util.fg, math.abs(amount))
end

function util.invertColor(color)
	if color ~= "NONE" then
		local hsl = hsluv.hex_to_hsluv(color)
		hsl[3] = 100 - hsl[3]
		if hsl[3] < 40 then
			hsl[3] = hsl[3] + (100 - hsl[3]) * util.day_brightness
		end
		return hsluv.hsluv_to_hex(hsl)
	end
	return color
end

-- Merge multiple tables together
function util.tbl_deep_extend(...)
	local lhs = {}
	for _, rhs in ipairs({ ... }) do
		for k, v in pairs(rhs) do
			if type(lhs[k]) == "table" and type(v) == "table" then
				lhs[k] = util.tbl_deep_extend(lhs[k], v)
			else
				lhs[k] = v
			end
		end
	end
	return lhs
end

function util.color_overrides(colors, config)
	if type(config.colors) == "table" then
		for key, value in pairs(config.colors) do
			if not colors[key] then
				error("Color " .. key .. " does not exist")
			end

			-- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
			if type(colors[key]) == "table" then
				util.color_overrides(colors[key], { colors = value })
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

function util.highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

	vim.cmd(hl)
	if color.link then
		vim.cmd("highlight! link " .. group .. " " .. color.link)
	end
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function util.template(str, table)
	return (str:gsub("($%b{})", function(w)
		return table[w:sub(3, -2)] or w
	end))
end

-- Template values in a table recursivly
---@param table table the table to be replaced
---@param values table the values to be replaced by the template strings in the table passed in
function util.template_table(table, values)
	-- if the value passed is a string the return templated resolved string
	if type(table) == "string" then
		return util.template(table, values)
	end

	-- If the table passed in is a table then iterate though the children and call template table
	for key, value in pairs(table) do
		table[key] = util.template_table(value, values)
	end

	return table
end

function util.syntax(tbl)
	for group, colors in pairs(tbl) do
		-- Allow highlight groups to reference each other by name
		if colors.bg == nil and colors.fg == nil and colors.sp == nil and colors.style == nil then
			if colors[1] ~= nil then
				colors = tbl[colors[1]]
			end
		end

		util.highlight(group, colors)
	end
end

function util.terminal(theme)
	vim.g.terminal_color_0 = theme.colors.black
	vim.g.terminal_color_1 = theme.colors.red
	vim.g.terminal_color_2 = theme.colors.green
	vim.g.terminal_color_3 = theme.colors.yellow
	vim.g.terminal_color_4 = theme.colors.blue
	vim.g.terminal_color_5 = theme.colors.purple
	vim.g.terminal_color_6 = theme.colors.cyan
	vim.g.terminal_color_7 = theme.colors.gray

	vim.g.terminal_color_8 = theme.colors.black_br
	vim.g.terminal_color_9 = theme.colors.red_br
	vim.g.terminal_color_10 = theme.colors.green_br
	vim.g.terminal_color_11 = theme.colors.yellow_br
	vim.g.terminal_color_12 = theme.colors.blue_br
	vim.g.terminal_color_13 = theme.colors.purple_br
	vim.g.terminal_color_14 = theme.colors.cyan_br
	vim.g.terminal_color_15 = theme.colors.white_br
end

function util.load(theme, exec_autocmd)
	-- only needed to clear when not the default colorscheme
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "onedark"

	local hlgroups = util.template_table(theme.config.hlgroups, theme.colors)
	local groups = util.tbl_deep_extend(theme.groups, hlgroups)

	util.syntax(groups)

	if theme.config.terminal_colors then
		util.terminal(theme)
	end

	if exec_autocmd then
		vim.cmd([[doautocmd ColorScheme]])
	end
end

return util
