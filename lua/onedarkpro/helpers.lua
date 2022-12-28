local config = require("onedarkpro.config")
local Color = require("onedarkpro.lib.color")

local M = {}

---Return all of the core colors for a given theme
---This method is used before the theme is fully loaded and colors are generated
---@param theme_name? string
---@return table
function M.theme_colors(theme_name)
    return require("onedarkpro.theme").colors(theme_name or config.theme)
end

---Make a color darker by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to darken the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.darken(color, amount, theme)
    if theme then return Color.from_hex(M.theme_colors(theme)[color]):darker(amount):to_css() end
    return Color.from_hex(color):darker(amount):to_css()
end

---Make a color lighter by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to lighten the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.lighten(color, amount, theme)
    if theme then return Color.from_hex(M.theme_colors(theme)[color]):lighter(amount):to_css() end
    return Color.from_hex(color):lighter(amount):to_css()
end

---Make a color brigher by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to lighten the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.brighten(color, amount, theme)
    if theme then return Color.from_hex(M.theme_colors(theme)[color]):brighter(amount):to_css() end
    return Color.from_hex(color):brighter(amount):to_css()
end

return M
