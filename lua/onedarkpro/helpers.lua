local config = require("onedarkpro.config")
local C = require("onedarkpro.lib.color")

local M = {}

---Return all of the core colors for a given theme
---This method is used before the theme is fully loaded and colors are generated
---@param theme_name? string
---@return table
function M.get_preloaded_colors(theme_name)
    return require("onedarkpro.theme").colors(theme_name or config.theme)
end

---Return a single color for a given theme or the current theme before it has loaded
---@param color string  The name of the color to load
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
function M.get_color(color, theme)
    return M.get_preloaded_colors(theme)[color]
end

---Return all of the colors in a table for a given theme or the current theme
---This method is used after the theme has fully loaded
---@param theme? string
---@return table
function M.get_colors(theme)
    local theme = require("onedarkpro.theme").load(theme or config.theme)
    return require("onedarkpro.utils").deep_extend(theme.palette, theme.generated, theme.meta)
end

---Make a color darker by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to darken the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.darken(color, amount, theme)
    if theme then return C(M.get_preloaded_colors(theme)[color]):darker(amount):to_css() end

    -- Get the color from the theme's palette
    local resolved_color = M.get_preloaded_colors()[color]
    if resolved_color then color = resolved_color end

    return C(color):darker(amount):to_css()
end

---Make a color lighter by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to lighten the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.lighten(color, amount, theme)
    if theme then return C(M.get_preloaded_colors(theme)[color]):lighter(amount):to_css() end

    -- Get the color from the theme's palette
    local resolved_color = M.get_preloaded_colors()[color]
    if resolved_color then color = resolved_color end

    return C(color):lighter(amount):to_css()
end

---Make a color brigher by an amount amount (Float [-100,100])
---@param color string  The name of the color to load
---@param amount number  The amount to lighten the color by
---@param theme? string  The name of theme to load from (e.g. "onedark", "onelight etc)
---@return string
function M.brighten(color, amount, theme)
    if theme then return C(M.get_preloaded_colors(theme)[color]):brighter(amount):to_css() end

    -- Get the color from the theme's palette
    local resolved_color = M.get_preloaded_colors()[color]
    if resolved_color then color = resolved_color end

    return C(color):brighter(amount):to_css()
end

return M
