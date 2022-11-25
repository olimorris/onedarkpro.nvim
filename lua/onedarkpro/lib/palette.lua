local M = {}

---Override a theme's default color palette with a user's config
---@param palette table
---@param theme table  The theme's meta data
---@return table
function M.override(palette, theme)
    local ovr = require("onedarkpro.override").colors

    for key, value in pairs(ovr) do
        if type(value) == "table" then
            -- Allows a user to specify colors by theme name or background color
            if key == theme.name or key == theme.background then
                for key, value in pairs(value) do
                    palette[key] = value
                end
            end
        else
            palette[key] = value
        end
    end

    return palette
end

return M
