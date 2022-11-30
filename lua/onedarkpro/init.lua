local config = require("onedarkpro.config")
local themes = require("onedarkpro.theme").themes

local M = {}

---Compile all the themes and cache them
---@return nil
function M.cache()
    local cache = require("onedarkpro.lib.cache")
    local compiler = require("onedarkpro.lib.compile")

    --TODO: Determine if the theme has already been created

    for _, theme in ipairs(themes) do
        local t = { theme = theme }
        compiler.compile(t)
        cache.write(t)
    end
end

---Clean all the cache files
---@return nil
function M.clean()
    local cache = require("onedarkpro.lib.cache")

    for _, theme in ipairs(themes) do
        local t = { theme = theme }
        cache.clean(t)
    end
end

---Reset the colorscheme to the default values
---@return nil
function M.reset()
    require("onedarkpro.config").reset()
    require("onedarkpro.override").reset()
end

---Setup the colorscheme
---@param opts table
---@return nil
function M.setup(opts)
    config.setup(opts)
    -- Must come after the config is setup
    local cached = require("onedarkpro.lib.cache")

    if cached.user_config__expired() then
        cached.user_config()
        M.cache()
    end

    if cached.fingerprint__invalid() then M.cache() end
end

---Load a theme
---@return nil
function M.load()
    local cached = require("onedarkpro.lib.cache")

    --TODO: REMOVE THIS
    M.cache()

    -- Some users may not call the setup method. In this case we need to load
    -- the config with the defaults. We also need to determine if the theme
    -- has been cached and compile and cache for all themes if it hasn't
    if not config.is_setup then
        --TODO: Cache user config hash
        --TODO: Cache fingerprint
        config.setup()
    end
    if cached.theme__missing(config.theme) then M.cache() end

    local _, cached_file = config.get_cached_info()

    local theme = loadfile(cached_file)
    if not theme then
        error("Could not load the cache file")
        return
    end

    -- Load the theme
    theme()
end

---Return all of the colors in a table for the current theme
---@return table
function M.get_colors()
    local util = require("onedarkpro.utils")
    local theme = require("onedarkpro.theme").load(config.theme)

    return util.deep_extend(theme.palette, theme.generated, theme.meta)
end

return M
