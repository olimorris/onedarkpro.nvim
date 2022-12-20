local M = {}

---Is the given value a hex color?
---@param color string
---@return boolean
local function is_hex(color)
    if string.sub(color, 1, 1) == "#" then return true end
    return false
end

---The given color is a string that should be executed as a function
---@param color string
---@return string
local function exec_color(color)
    local ld = load or loadstring

    local loaded, err = ld("return " .. color)
    assert(loaded, ("Couldn't set `color`: %s"):format(err))
    return loaded()
end

---Override a theme's default color palette with a user's
---@param colors table  The colors to override the palette with
---@param palette table  The colord to be overriden
---@param theme table  The theme's meta data
---@return table
function M.override(colors, palette, theme)
    for name, color in pairs(colors) do
        if type(color) == "table" then
            -- Allows a user to specify colors by theme name or background color
            if name == theme.name or name == theme.background then
                for k, v in pairs(color) do
                    if is_hex(v) then
                        palette[k] = v
                    else
                        palette[k] = exec_color(v)
                    end
                    palette[k] = v
                end
            end
        else
            if is_hex(color) then
                palette[name] = color
            else
                palette[name] = exec_color(color)
            end
        end
    end

    return palette
end

return M
