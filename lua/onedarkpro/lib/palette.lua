local M = {}

---Override a theme's default color palette with a user's config
---@param palette table  the theme's color palette
---@param theme string  the name of the theme to apply
---@return table
function M.override(palette, theme)
    local ovr = require("onedarkpro.override").colors

    for key, value in pairs(ovr) do
        if type(value) == "table" then
            if key == theme then
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
