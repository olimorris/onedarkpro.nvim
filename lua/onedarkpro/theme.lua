local M = {}

M.themes = {
    "onedark",
    "onelight",
    "onedark_vivid",
    "onedark_dark",
}

---Load a theme and apply any user color overrides
---@param theme string
---@return table
function M.load(theme)
    local config = require("onedarkpro.config").config

    theme = require("onedarkpro.themes." .. theme)

    -- Apply user color overrides directly to the theme
    if config.colors then theme.palette = require("onedarkpro.lib.palette").override(theme.palette, theme.meta) end

    -- So the generated colors make use of the overrides
    if type(theme.generated) == "function" then theme.generated = theme.generated(theme.palette) end

    return theme
end

return M