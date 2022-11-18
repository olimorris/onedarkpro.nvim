local M = {}

local caching = false
local logger = require("onedarkpro.utils.logging")

---Allow the user to override the default configuration
---@param opts table  The user's config
---@return nil
function M.setup(opts)
    opts = opts or {}

    local config = require("onedarkpro.config")
    local override = require("onedarkpro.override")

    config.setup(opts)

    logger:set_level(config.config.log_level)
    logger.debug("Config: Start")

    if opts.caching then
        caching = true
    end

    if opts.colors then
        logger.debug("Config: Overriding colors")
        override.colors = opts.colors
    end

    if opts.highlights then
        logger.debug("Config: Overriding highlight groups")
        override.highlights = opts.highlights
    end

    logger.debug("Config: End", config.config)
end

---Load the theme
---@param cache_loaded? boolean  Has the theme already been loaded from the cache?
---@return nil
function M.load(cache_loaded)
    -- TODO: Pass the theme from the config to the theme.load function
    local theme = require("onedarkpro.theme").load()
    local config = require("onedarkpro.config").init() -- If the setup function is bypassed, this loads the default config

    local cache = require("onedarkpro.lib.cache")
    local override = require("onedarkpro.override")
    local highlights = require("onedarkpro.highlight")

    logger:set_level(config.log_level)
    logger.debug("Begin theme load:", theme)

    if caching and cache.exists(theme.meta.name) and not cache_loaded then
        local ok, loaded_cache = pcall(cache.load, theme, config)
        if ok then
            logger.debug("CACHE: Completed load")
            return loaded_cache
        end

        logger.debug("CACHE: Could not be loaded", loaded_cache)
        vim.notify("[OneDarkPro.nvim] Could not load from cache. It might be corrupted", vim.log.levels.WARN)
    end

    highlights.editor = require("onedarkpro.highlights.editor").groups(theme, config)
    highlights.syntax = require("onedarkpro.highlights.syntax").groups(theme, config)
    highlights.filetypes = require("onedarkpro.highlights.filetype").groups(theme, config)
    highlights.plugins = require("onedarkpro.highlights.plugin").groups(theme, config)

    if override.highlights then
        highlights.custom = require("onedarkpro.utils.variable").replace_vars(
            vim.deepcopy(override.highlights),
            require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated)
        )
    end

    require("onedarkpro.main").load(theme, config)

    -- If a user has set caching to be true but doesn't yet have a cache file, create one
    if caching and not cache.exists(theme.meta.name) then
        logger.debug("CACHE: Automatically create the cache file")
        return cache.generate()
    end
end

---Get the color palette for a specific theme
---@param theme_name string
---@return table
function M.get_colors(theme_name)
    if vim.g.onedarkpro_colors then
        return vim.g.onedarkpro_colors
    end

    local theme = require("onedarkpro.theme").load(theme_name)
    return require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated, theme.meta)
end

---Cache a user's config
---@return nil
function M.cache()
    require("onedarkpro.lib.cache").generate()
    return vim.notify("[OneDarkPro] Cache generated!")
end

---Delete a user's cache
---@return nil
function M.clean()
    require("onedarkpro.lib.cache").clean()
    return vim.notify("[OneDarkPro] Cache cleaned!")
end

return M
