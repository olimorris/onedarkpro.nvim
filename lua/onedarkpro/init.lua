local config = require("onedarkpro.config")
local file = require("onedarkpro.utils.file")

local M = {}

---Compile all the themes and cache them
---@return nil
function M.cache()
    local cache = require("onedarkpro.lib.cache")
    local themes = require("onedarkpro.theme").themes
    local compiler = require("onedarkpro.lib.compile")

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
    local themes = require("onedarkpro.theme").themes

    for _, theme in ipairs(themes) do
        cache.clean({ theme = theme })
    end

    cache.clean({ file = "fingerprint" })
    cache.clean({ file = "user_config_hash" })
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
    local should_cache = false
    config.setup(opts)

    -- Allow users to bypass the hashing and generate themes everytime
    if not config.config.caching then
        M.cache()
        return
    end

    local cache_path, _ = config.get_cached_info()
    file.ensure_dir(cache_path)

    --BUG: Have to run hash twice to get consistent hash
    config.hash()

    -- Check the user config hash
    local hash_config_path = file.join_paths(cache_path, "user_config_hash")
    local current_hash = tostring(config.hash())
    local stored_hash = tostring(file.read(hash_config_path))

    if not stored_hash or current_hash ~= stored_hash then
        should_cache = true
        file.write(hash_config_path, current_hash)
    end

    -- Check the colorscheme's fingerprint
    local fingerprint_path = file.join_paths(cache_path, "fingerprint")
    local current_fingerprint = require("onedarkpro.fingerprint")
    local stored_fingerprint = file.read(fingerprint_path)

    if not stored_fingerprint or current_fingerprint ~= stored_fingerprint then
        should_cache = true
        file.write(fingerprint_path, current_fingerprint)
    end

    if should_cache then M.cache() end
end

---Load a theme
---@return nil
function M.load()
    -- Some users may not call the setup method. In this case we need to load
    -- the config with the defaults. We also need to determine if the theme
    -- has been cached and compile and cache for all themes if it hasn't
    if not config.is_setup then config.setup() end

    local _, cached_theme = config.get_cached_info()
    if not file.exists(cached_theme) then M.cache() end

    local theme = loadfile(cached_theme)
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
