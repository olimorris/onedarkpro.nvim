local config = require("onedarkpro.config")
local Color = require("onedarkpro.lib.color")

local M = {}

---Return all of the core colors for a given theme
---This method is used before the theme is fully loaded and colors are generated
---@param theme_name? string
---@return table
function M.get_preloaded_colors(theme_name)
    return require("onedarkpro.theme").colors(theme_name or config.theme)
end

---Return all of the colors in a table for a given theme or the current theme
---This method is used after the theme has fully loaded
---@param theme_name? string
---@return table
function M.get_colors(theme_name)
    local theme = require("onedarkpro.theme").load(theme_name or config.theme)
    return require("onedarkpro.utils").deep_extend(theme.palette, theme.generated, theme.meta)
end

---Make a color darker by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to darken the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.darken(color, amount, theme)
    if theme then return Color.from_hex(M.get_preloaded_colors(theme)[color]):darker(amount):to_css() end
    return Color.from_hex(color):darker(amount):to_css()
end

---Make a color lighter by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to lighten the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.lighten(color, amount, theme)
    if theme then return Color.from_hex(M.get_preloaded_colors(theme)[color]):lighter(amount):to_css() end
    return Color.from_hex(color):lighter(amount):to_css()
end

---Make a color brigher by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to lighten the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.brighten(color, amount, theme)
    if theme then return Color.from_hex(M.get_preloaded_colors(theme)[color]):brighter(amount):to_css() end
    return Color.from_hex(color):brighter(amount):to_css()
end

return M
