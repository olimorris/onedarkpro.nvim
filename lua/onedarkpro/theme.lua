local M = {}

M.themes = {
    "onedark",
    "onelight",
    "onedark_vivid",
    "onedark_dark",
}

---Load a theme and apply any user color overrides
---@return table
function M.load(theme)
    theme = require("onedarkpro.themes." .. theme)

    -- Apply user color overrides directly to the theme
    if require("onedarkpro.override").has_override then
        theme.palette = require("onedarkpro.lib.palette").override(theme.palette, theme.meta.name)
    end

    -- Generated colors make use of the user's color overrides
    if type(theme.generated) == "function" then
        theme.generated = theme.generated(theme.palette)
    end

    return theme
end

return M
