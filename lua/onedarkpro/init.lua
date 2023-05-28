local util = require("onedarkpro.utils")
local config = require("onedarkpro.config")

local M = {}

---Compile all the themes and cache them
---@return nil
function M.cache()
    local cache = require("onedarkpro.lib.cache")
    local themes = require("onedarkpro.theme").themes
    local compiler = require("onedarkpro.lib.compile")

    for _, theme in ipairs(themes) do
        cache.write({
            theme = theme,
            cache = compiler.compile(theme),
        })
    end
end

---Clean all of the theme's files on the disk
---@return nil
function M.clean()
    local cache = require("onedarkpro.lib.cache")
    local themes = require("onedarkpro.theme").themes

    for _, theme in ipairs(themes) do
        cache.clean({ theme = theme })
    end

    -- Remove hash files
    cache.clean({ file = "cache" })
end

---Reset the colorscheme to the default values
---@return nil
function M.reset()
    --TODO: To be implemented
    require("onedarkpro.config").reset()
    require("onedarkpro.override").reset()
end

---Determine if the cache is valid or if it needs to be regenerated
---@return nil
local function validate_cache()
    util.ensure_dir(config.config.cache_path)

    local hash_path = util.join_paths(config.config.cache_path, "cache")

    local git_path = util.join_paths(debug.getinfo(1).source:sub(2, -25), ".git")
    local git = vim.fn.getftime(git_path)
    local cached_hash = config.hash() .. (git == -1 and git_path or git)

    if cached_hash ~= util.read(hash_path) then
        M.cache()
        util.write(hash_path, cached_hash)
    end
end

---Setup the theme
---@param opts table
---@return nil
function M.setup(opts)
    config.setup(opts)

    -- Allow users to force generate themes at startup
    if not config.config.caching then return M.cache() end

    validate_cache()
end

---Load a theme
---@return nil
function M.load()
    --Warn users that Neovim 0.9.0 or greater will be needed in the future
    if vim.fn.has("nvim-0.9") == 0 then
        require("onedarkpro.utils.deprecate").write(
            "This plugin will soon require your ",
            { "Neovim version to be at least 0.9.0\n", "ErrorMsg" },
            "This will become active on ",
            { "9th June, 2023\n", "WarningMsg" },
            "You can pin the plugin to the `0.8.0` tag if required"
        )
    end

    -- Users may not call the setup method but should still get caching
    if not config.is_setup then
        config.setup()
        validate_cache()
    end

    -- Generate a cache if doesn't already exist
    local _, cached_theme = config.get_cached_info()
    if not util.exists(cached_theme) then M.cache() end

    local ok, theme = pcall(loadfile, cached_theme)
    if not ok then
        error("Could not load the cache file")
        return
    end

    -- Load the theme
    if theme then theme() end
end

return M
