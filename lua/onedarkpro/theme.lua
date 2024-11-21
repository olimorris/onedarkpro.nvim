local util = require("onedarkpro.utils")

local M = {}

---Get the core color palette for a given theme
---@param theme_name string
---@return table
function M.colors(theme_name)
    local config = require("onedarkpro.config")

    local ok, theme = pcall(require, "onedarkpro.themes." .. theme_name)
    if not ok then
        ok, theme = pcall(loadfile, config.themes[theme_name])
        if type(theme) == "function" then theme = theme() end
    end

    if not ok or not theme then
        return vim.notify(string.format("Could not load theme %s", theme_name), vim.log.levels.ERROR)
    end

    return theme.palette
end

---Load a theme and apply any user color overrides
---@param theme_name string|table
---@return table
function M.load(theme_name)
    local config = require("onedarkpro.config")

    local ok, theme = pcall(require, "onedarkpro.themes." .. theme_name)
    if not ok then
        ok, theme = pcall(loadfile, config.themes[theme_name])
        if type(theme) == "function" then theme = theme() end
    end

    if not ok or not theme then
        return vim.notify(string.format("Could not load theme %s", theme_name), vim.log.levels.ERROR)
    end

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
