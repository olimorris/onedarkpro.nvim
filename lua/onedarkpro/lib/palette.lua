local colors = require("onedarkpro.config").config.colors

local M = {}

---Override a theme's default color palette with a user's config
---@param palette table
---@param theme table  The theme's meta data
---@return table
function M.override(palette, theme)
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
