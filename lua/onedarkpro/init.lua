local M = {}

local config = require("onedarkpro.config")
local override = require("onedarkpro.override")

vim.g.onedarkpro_log_level = "error"
local logger = require("onedarkpro.utils.logging")

---Compile all the themes into cached files
function M.cache()
    local cache = require("onedarkpro.lib.cache")
    local themes = require("onedarkpro.theme").themes
    local compiler = require("onedarkpro.lib.compile")

    for _, theme in ipairs(themes) do
        local t = { theme = theme }
        cache.write(t, compiler.compile(t))
    end
end

---Setup the colorscheme
---@param opts table
function M.setup(opts)
    opts = opts or {}

    config.setup(opts)

    if opts.colors then
        override.colors = opts.colors
    end

    if opts.highlights then
        override.highlights = opts.highlights
    end

    --TODO: Check if the cached file is adequate or should be compiled

    --TODO: If not adequate, compile and cache it
    M.cache()
end

---Load the colorscheme
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

    f()
end

---Get the color palette for a specific theme
---@return table
function M.get_colors()
    local theme = require("onedarkpro.theme").load(config.theme)
    return require("onedarkpro.utils").deep_extend(theme.palette, theme.generated, theme.meta)
end

-- ---Cache a user's config
-- ---@return nil
-- function M.cache()
--     -- require("onedarkpro.lib.cache").generate()
--     --TODO: Compile and generate the cache
--     return vim.notify("[OneDarkPro] Cache generated!")
-- end
--
-- ---Delete a user's cache
-- ---@return nil
-- function M.clean()
--     require("onedarkpro.lib.cache").clean()
--     return vim.notify("[OneDarkPro] Cache cleaned!")
-- end

return M
