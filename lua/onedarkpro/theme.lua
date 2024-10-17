local M = {}

M.themes = {
    "onedark",
    "onelight",
    "onedark_vivid",
    "onedark_dark",
}

---Get the core color palette for a given theme
---@param theme string
---@return table
function M.colors(theme)
    return require("onedarkpro.themes." .. theme).palette
end

---Load a theme and apply any user color overrides
---@param theme string
---@return table
function M.load(theme)
    local config = require("onedarkpro.config")

    theme = require("onedarkpro.themes." .. theme)

    -- Apply user color overrides directly to the theme
    if config and config.colors then
        theme.palette = require("onedarkpro.lib.palette").override(config.colors, theme.palette, theme.meta)
    end

    -- Execute the generated colors using the new palette
    if type(theme.generated) == "function" then theme.generated = theme.generated(theme.palette) end

    return theme
end

return M
