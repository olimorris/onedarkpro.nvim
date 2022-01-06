local utils = {}

utils.bg = "#000000"
utils.fg = "#ffffff"
utils.day_brightness = 0.3

---Print a warning message to the user
---@param... string
---@return table
function utils.warn(...)
	for _, msg in ipairs({ ... }) do
		vim.cmd('echohl WarningMsg | echom "OneDarkPro.nvim: ' .. msg .. '" | echohl NONE')
	end
end

---Convert a hex color into an rgb
---@param hex_str string
---@return table
local hex_to_rgb = function(hex_str)
	local hex = "[abcdef0-9][abcdef0-9]"
	local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
	hex_str = string.lower(hex_str)

	assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

	local r, g, b = string.match(hex_str, pat)
	return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---Blend colors together
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

---Darken a hex color
---@param hex string
---@param amount integer
---@param bg string
---@return table
function utils.darken(hex, amount, bg)
	return utils.blend(hex, bg or utils.bg, math.abs(amount))
end

---Lighten a hex color
---@param hex string
---@param amount integer
---@param fg string
---@return table
function utils.lighten(hex, amount, fg)
	return utils.blend(hex, fg or utils.fg, math.abs(amount))
end

---Merge many tables together
---@param... table
---@return table
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

---Set or override the default colors in the theme with the user's config
---@param colors table
---@param config table
---@return nil
function utils.color_overrides(colors, config)
	if type(config.colors) == "table" then
		for key, value in pairs(config.colors) do
			-- check if the user has specified a table within the colors table
			if type(config.colors[key]) == "table" then
				-- only override colors if the key matches the name of the active theme
				if key == colors.name then
					for key, value in pairs(config.colors[key]) do
						utils.set_or_create_color(colors, key, value)
					end
				end
			else
				-- otherwise just set them
				utils.set_or_create_color(colors, key, value)
			end
		end
	end
end

---Add a color to the colors table
---@param colors table
---@param key string
---@param value string
---@return nil
function utils.set_or_create_color(colors, key, value)
	-- Patch: https://github.com/ful1e5/onedark.nvim/issues/6
	if value:lower() == "none" then
		colors[key] = "NONE"
	elseif string.sub(value, 1, 1) == "#" then
		-- hex override
		colors[key] = value
	else
		-- create the new color
		colors[key] = colors[value]
	end
end

---Create the highlight groups from the theme
---@param group string
---@param color table
---@return nil
function utils.create_highlights(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

	if color.link and (color.fg == nil and color.bg == nil and color.sp == nil) then
		vim.cmd("highlight! link " .. group .. " " .. color.link)
	else
		vim.cmd(hl)
	end
end

---Simple string interpolation.
---Example template: "${name} is ${value}"
---@param str string template string
---@param table table key value pairs to replace in the string
---@return table
function utils.template(str, table)
	return (str:gsub("($%b{})", function(w)
		return table[w:sub(3, -2)] or w
	end))
end

---Template values in a table recursivly
---@param table table the table to be replaced
---@param values table the values to be replaced by the template strings in the table passed in
---@return table table
function utils.template_table(table, values)
	-- if the value passed is a string the return templated resolved string
	if type(table) == "string" then
		return utils.template(table, values)
	end

	-- If the table passed in has a table then iterate though the children and call template table
	for key, value in pairs(table) do
		table[key] = utils.template_table(value, values)
	end

	return table
end

---Set the theme's syntax
---@param highlight_groups table
---@return nil
function utils.set_syntax(highlight_groups)
	for group, colors in pairs(highlight_groups) do
		utils.create_highlights(group, colors)
	end
end

---Set the terminal colors
---@param theme table
---@return nil
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

---Pretty print a table
---@param tbl table
---@return string
function utils.print_table(tbl)
	require("pl.pretty").dump(tbl)
end

---Load the desired theme
---@param theme table
---@return nil
function utils.load_theme(theme)
	-- Prevent double loading of the theme
	if vim.g.colors_name == "onedarkpro" and vim.g.onedarkpro_style == theme.colors.name then
		return
	end

	vim.cmd("hi clear")

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "onedarkpro"
	vim.g.onedarkpro_style = theme.colors.name

	-- Replace color variables in the user's custom hlgroups
	local hlgroups = utils.template_table(theme.config.hlgroups, theme.colors)

	-- Merge the user's custom hlgroups with the theme's
	local adjusted_hlgroups = utils.tbl_deep_extend(theme.hlgroups, hlgroups)

	utils.set_syntax(adjusted_hlgroups)

	-- Colors for the Neovim terminal
	if theme.config.options.terminal_colors then
		utils.terminal(theme)
	end

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
			"EXAMPLE: onedarkpro.setup({ hlgroups = { ModeMsg = { link = 'LineNr' } } })",
			"See https://github.com/olimorris/onedarkpro.nvim for more info",
			"-----------------------------------------------------------------------------------"
		)
	end

	--[[
		Warn the user about the deprecated cursorline option
	]]
	if theme.config.highlight_cursorline then
		utils.warn(
			"`highlight_cursorline` has been moved into the options table of your config and is now deprecated",
			"EXAMPLE: onedarkpro.setup({ options = { highlight_cursorline = true } })",
			"See https://github.com/olimorris/onedarkpro.nvim for more info",
			"-----------------------------------------------------------------------------------"
		)
	end
	if theme.config.options.highlight_cursorline then
		utils.warn(
			"`highlight_cursorline` has been renamed to `cursorline` and will soon be deprecated",
			"EXAMPLE: onedarkpro.setup({ options = { cursorline = true } })",
			"See https://github.com/olimorris/onedarkpro.nvim for more info",
			"-----------------------------------------------------------------------------------"
		)
	end

	--[[
		Warn the user about the deprecated transparent option
	]]
	if theme.config.options.transparent then
		utils.warn(
			"The `transparent` option has been renamed to `transparency` and will soon be deprecated",
			"EXAMPLE: onedarkpro.setup({ options = { transparency = true } })",
			"See https://github.com/olimorris/onedarkpro.nvim for more info",
			"-----------------------------------------------------------------------------------"
		)
	end

	-- Trigger the colorscheme autocommand
	vim.cmd([[doautocmd ColorScheme]])
end

return utils
