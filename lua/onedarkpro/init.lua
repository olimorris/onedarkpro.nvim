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

    -- Remove hash files
    cache.clean({ file = "fingerprint" })
    cache.clean({ file = "user_config_hash" })
end

---Reset the colorscheme to the default values
---@return nil
function M.reset()
    --TODO: To be implemented
    require("onedarkpro.config").reset()
    require("onedarkpro.override").reset()
end

---Determine if the current fingerprint is valid, updating it if not
---@param cache_path string
---@return boolean
local function valid_user_config(cache_path)
    local hash_config_path = file.join_paths(cache_path, "user_config_hash")
    local current_hash = tostring(config.hash())
    local stored_hash = tostring(file.read(hash_config_path))

    if not stored_hash or current_hash ~= stored_hash then
        file.write(hash_config_path, current_hash)
        return false
    end

    return true
end

---Determine if the current fingerprint is valid, updating it if not
---@param cache_path string
---@return boolean
local function valid_fingerprint(cache_path)
    local fingerprint_path = file.join_paths(cache_path, "fingerprint")
    local current_fingerprint = require("onedarkpro.fingerprint")
    local stored_fingerprint = file.read(fingerprint_path)

    if not stored_fingerprint or current_fingerprint ~= stored_fingerprint then
        file.write(fingerprint_path, current_fingerprint)
        return false
    end

    return true
end

---Setup the colorscheme
---@param opts table
---@return nil
function M.setup(opts)
    local should_cache = false
    config.setup(opts)

    -- Allow users to bypass the hashing and generate colorschemes everytime
    if not config.config.caching then return M.cache() end

    local cache_path, _ = config.get_cached_info()
    file.ensure_dir(cache_path)

    if not valid_user_config(cache_path) then should_cache = true end
    if not valid_fingerprint(cache_path) then should_cache = true end

    if should_cache then M.cache() end
end

---Load a theme
---@return nil
function M.load()
    -- Some users may not call the setup method and we account for that
    if not config.is_setup then
        config.setup()
        local cache_path, _ = config.get_cached_info()

        -- Non-setup users still get the benefits of caching so we need to check
        -- that the fingerprint is valid and generate new colorschemes if not
        if not valid_fingerprint(cache_path) then M.cache() end
    end

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

---Return all of the colors in a table for a given theme or the current theme
---@param theme_name? string
---@return table
function M.get_colors(theme_name)
    local util = require("onedarkpro.utils")

    local theme = require("onedarkpro.theme").load(theme_name or config.theme)
    return util.deep_extend(theme.palette, theme.generated, theme.meta)
end

return M
