local config = require("onedarkpro.config")

local M = {}

vim.g.onedarkpro_log_level = "error"

---Compile all the themes and cache them
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

function M.reset()
    require("onedarkpro.config").reset()
    require("onedarkpro.override").reset()
end

---Setup the colorscheme
---@param opts table
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
