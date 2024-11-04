local util = require("onedarkpro.utils")

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

    theme.rainbow = {
        theme.palette.red,
        theme.palette.orange,
        theme.palette.yellow,
        theme.palette.green,
        theme.palette.blue,
        theme.palette.cyan,
        theme.palette.purple,
    }

    -- Execute the generated colors using the new palette
    if type(theme.generated) == "function" then theme.generated = theme.generated(theme.palette) end

    -- Users can provide their own rainbow colors by using syntax like ${red} etc
    if config and config.colors and config.colors.rainbow then
        theme.rainbow = util.replace_vars(config.colors.rainbow, util.deep_extend(theme.palette, theme.generated))
    end

    return theme
end

return M
