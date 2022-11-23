local M = {}

local config = require("onedarkpro.config")
local override = require("onedarkpro.override")

vim.g.onedarkpro_log_level = "error"
local logger = require("onedarkpro.utils.logging")

---Setup the color scheme
---@param opts table
function M.setup(opts)
    opts = opts or {}

    logger:set_level(vim.g.onedarkpro_log_level)

    --TODO: Check cache at this point

    logger.debug("CONFIG: Start")
    config.setup(opts)

    if opts.colors then
        logger.debug("CONFIG: Overriding colors")
        override.colors = opts.colors
    end

    if opts.highlights then
        logger.debug("CONFIG: Overriding highlight groups")
        override.highlights = opts.highlights
    end

    logger.debug("CONFIG:", config)
end

---Load the color scheme
function M.load()
    logger:set_level(vim.g.onedarkpro_log_level)

    --TODO: Check cache at this point

    -- For when the user does not call the setup function
    if not config.is_setup then
        config.setup()
    end

    local theme = require("onedarkpro.theme").load()
    logger.debug("THEME:", theme)

    local highlights = require("onedarkpro.highlight")

    highlights.editor = require("onedarkpro.highlights.editor").groups()
    highlights.syntax = require("onedarkpro.highlights.syntax").groups()
    highlights.filetypes = require("onedarkpro.highlights.filetype").groups()
    highlights.plugins = require("onedarkpro.highlights.plugin").groups()

    if override.highlights then
        highlights.custom = require("onedarkpro.utils.variable").replace_vars(
            vim.deepcopy(override.highlights),
            require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated)
        )
    end

    require("onedarkpro.main").load(theme)
end

---Get the color palette for a specific theme
---@return table
function M.get_colors()
    if vim.g.onedarkpro_colors then
        return vim.g.onedarkpro_colors
    end

    --TEST: Write a test for this
    local theme = require("onedarkpro.theme").load()
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
