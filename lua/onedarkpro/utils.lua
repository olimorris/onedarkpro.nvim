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
    return colors
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
    return colors
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

---Replace ${variables} in a table
---Example replace_vars: "${name} is ${value}"
---@param str string replace_vars string
---@param table table key value pairs to replace in the string
---@return table
function utils.replace_vars(str, table)
    return (str:gsub("($%b{})", function(w)
        return table[w:sub(3, -2)] or w
    end))
end

---Replace variables in a table recursivly
---@param table table the table to be replaced
---@param values table the values to be replaced by the replace_vars strings in the table passed in
---@return table table
function utils.recursive_replace(table, values)
    -- if the value passed is a string the return templated resolved string
    if type(table) == "string" then
        return utils.replace_vars(table, values)
    end

    -- If the table passed in has a table then iterate though the children and call replace_vars table
    for key, value in pairs(table) do
        table[key] = utils.recursive_replace(value, values)
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

---Set an autocommand
---Taken from https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
-- @param definitions table
-- @return vim.api
function utils.create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            -- if type(def) == 'table' and type(def[#def]) == 'function' then
            -- 	def[#def] = lua_callback(def[#def])
            -- end
            local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

---When a user moves from a filetype with specific hlgroups to a filetype with
---none, we need to apply the theme's default hlgroups. To make this less
---expensive, we match the users configured filetype hlgroups to the theme's
---@param hlgroups  table   hlgroups from the theme + the user's config
---@param fhlgroups table hlgroups for filetypes from the user's config
---@return table
local function intersect_groups(hlgroups, fhlgroups)
    -- Find the intersection between the tables and extract the common hlgroups
    local matched_groups = {}
    for filetype, _ in pairs(fhlgroups) do
        for group, _ in pairs(fhlgroups[filetype]) do
            if matched_groups[group] == nil then
                matched_groups[group] = true
            end
        end
    end

    -- Then extract the matched groups from the theme's hlgroups
    local retained_hlgroups = {}
    for group, _ in pairs(matched_groups) do
        retained_hlgroups[group] = hlgroups[group]
    end

    return retained_hlgroups
end

---Return true if any pattern in the tbl matches the provided value
---@param tbl table
---@param val string
---@return boolean
local function find_pattern_match(tbl, val)
    return tbl and next(vim.tbl_filter(function(pattern)
        return val:match(pattern)
    end, tbl))
end

---Ignore a buffer based on the filetype or the buffertype
-- @return boolean
local function ignore_buffer()
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype

    return find_pattern_match(vim.g.theme_fhlgroups_ignore.filetypes, filetype)
        or find_pattern_match(vim.g.theme_fhlgroups_ignore.buftypes, buftype)
end

---Set custom hlgroups based on the buffer filetype
---@param force_apply string forcefully apply highlighting
---@return nil
function utils.set_fhlgroups(force_apply)
    local filetype = vim.bo.filetype

    if (filetype == vim.g.theme_last_filetype and not force_apply) or ignore_buffer() or filetype == "" then
        return
    end

    local hlgroups = vim.g.theme_hlgroups
    local fhlgroups = vim.g.theme_fhlgroups

    -- If the user has moved to a buffer with a new filetype and there are no
    -- specific configs set, then we reapply the theme's default hlgroups
    if vim.g.theme_applied_fhlgroups and vim.g.theme_last_filetype ~= filetype then
        for group, colors in pairs(hlgroups) do
            utils.create_highlights(group, colors)
        end
        vim.g.theme_last_filetype = filetype
        vim.g.theme_applied_fhlgroups = false
    end

    if fhlgroups[filetype] then
        for group, colors in pairs(fhlgroups[filetype]) do
            utils.create_highlights(group, colors)
        end
        vim.g.theme_last_filetype = filetype
        vim.g.theme_applied_fhlgroups = true
    end
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

    -- Preserve the users original configuration at load
    if vim.g.colors_name == nil then
        vim.g.onedarkpro_config = theme.config
    end
    local config = vim.g.onedarkpro_config or theme.config

    vim.o.termguicolors = true
    vim.g.colors_name = "onedarkpro"
    vim.g.onedarkpro_colors = theme.colors
    vim.g.onedarkpro_style = theme.colors.name

    -- Replace color variables in the user's custom hlgroups
    local hlgroups = utils.recursive_replace(config.hlgroups, theme.colors)

    -- Merge the user's custom hlgroups with the theme's
    local adjusted_hlgroups = utils.tbl_deep_extend(theme.hlgroups, hlgroups)

    utils.set_syntax(adjusted_hlgroups)

    -- Colors for the Neovim terminal
    if theme.config.options.terminal_colors then
        utils.terminal(theme)
    end

    -- Configure any filetype highlight groups
    local next = next -- next as a local var is most efficient
    if next(config.filetype_hlgroups) ~= nil then
        -- Replace the color variables with actual colors
        local fhlgroups = utils.recursive_replace(config.filetype_hlgroups, theme.colors)

        -- Set global vars to be accessed when moving between filetype buffers
        vim.g.theme_fhlgroups = fhlgroups
        vim.g.theme_fhlgroups_ignore = config.filetype_hlgroups_ignore
        vim.g.theme_hlgroups = intersect_groups(adjusted_hlgroups, fhlgroups)

        local autocmds = {
            onedarkpro_theme_autocmds = {
                -- TODO: add additional events such as BufFilePost, BufDelete
                {
                    "BufEnter,BufRead",
                    "*",
                    'lua vim.schedule(function() require("onedarkpro.utils").set_fhlgroups() end)',
                },
                -- Brute force a refresh when the colorscheme changes
                {
                    "ColorScheme",
                    "*",
                    'lua vim.schedule(function() require("onedarkpro.utils").set_fhlgroups(true) end)',
                },
            },
        }
        utils.create_augroups(autocmds)
    end

    -- Trigger an autocommand on loading the theme
    vim.cmd([[doautocmd ColorScheme]])
end

return utils
