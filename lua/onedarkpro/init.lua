local config = require("onedarkpro.config")

local M = {}

vim.g.onedarkpro_log_level = "error"

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

---Clean the cache files from disk
---@return nil
function M.clean()
    local cache = require("onedarkpro.lib.cache")
    local themes = require("onedarkpro.theme").themes

    for _, theme in ipairs(themes) do
        local t = { theme = theme }
        cache.clean(t)
    end
end

---Reset the configuration to the default values
---@return nil
function M.reset()
    require("onedarkpro.config").reset()
    require("onedarkpro.override").reset()
end

---Setup the colorscheme
---@param opts table
---@return nil
function M.setup(opts)
    opts = opts or {}
    config.setup(opts)

    --TODO: Check if the cached file is adequate or should be compiled

    --TODO: If not adequate, compile and cache it
    M.cache()
end

---Load the colorscheme
---@return function|nil
function M.load()
    -- For when the user does not call the setup function
    if not config.is_setup then
        config.setup()
    end

    --TODO: Load the compile file
    local _, compiled_file = config.get_cached_info()
    local f = loadfile(compiled_file)

    --TODO: If that fails, then compile and then load the compile file
    if not f then
        M.cache()
        f = loadfile(compiled_file)
    end

    if f then
        return f()
    end

    --TODO: Add error message about not loading
    return
end

---Get the color palette for the current theme
---@return table
function M.get_colors()
    local theme = require("onedarkpro.theme").load(config.theme)
    return require("onedarkpro.utils").deep_extend(theme.palette, theme.generated, theme.meta)
end

return M
