local M = {}

---Check that a string is actually a hex color
---@param color string
---@return boolean
local function is_hex(color)
    local s = color:lower():match("#?([a-f0-9]+)")

    if #s == 6 or #s == 3 then return true end
    return false
end

---Resolve a color from a string function
---This enables users to pass a function in as a string to determine a color
---@param str string The string to resolve
---@return string
local function resolve_color(str)
    local ld = load or loadstring

    local loaded, err = ld("return " .. str)
    assert(loaded, ("Couldn't set `color`: %s"):format(err))
    return loaded()
end

---Set a color to the theme's color palette
---@param color string
---@param palette table
---@param name string
---@return nil
local function set_color(color, palette, name)
    palette[name] = is_hex(color) and color or resolve_color(color)
end

---Override a theme's default color palette with a user's
---@param colors table  The colors to override the palette with
---@param palette table  The colord to be overriden
---@param theme table  The theme's meta data
---@return table
function M.override(colors, palette, theme)
    for name, color in pairs(colors) do
        if type(color) == "table" then
            -- Only override if the table key is a theme or a background color
            if name == theme.name or name == theme.background then M.override(color, palette, theme) end
        else
            set_color(color, palette, name)
        end
    end

    return palette
end

return M
