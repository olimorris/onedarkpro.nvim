local M = {}

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
                    palette[k] = v
                end
            end
        else
            palette[name] = color
        end
    end

    return palette
end

return M
