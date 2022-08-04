local M = {}

local override = {}

function override.colors(colors)
    require("onedarkpro.override").colors = colors
end

function override.highlights(highlights)
    require("onedarkpro.override").highlights = highlights
end

M.override = override

---Setup the theme via the default config or the users own
---@param opts table  User's config
---@return nil
function M.setup(opts)
    opts = opts or {}
    require("onedarkpro.config").setup(opts)

    if opts.colors then
        override.colors(opts.colors)
    end

    if opts.hlgroups then
        override.highlights(opts.hlgroups)
    end
end

local highlight = {}

function highlight.editor(editor)
    require("onedarkpro.highlight").editor = editor
end

function highlight.syntax(syntax)
    require("onedarkpro.highlight").syntax = syntax
end

function highlight.plugins(plugins)
    require("onedarkpro.highlight").plugins = plugins
end

function highlight.custom(groups)
    require("onedarkpro.highlight").custom = groups
end

M.highlight = highlight

---Load the theme
---@return table
function M.load()
    local theme = require("onedarkpro.theme").load()
    override = require("onedarkpro.override")

    highlight.editor(require("onedarkpro.highlights.editor").groups(theme))
    highlight.syntax(require("onedarkpro.highlights.syntax").groups(theme))
    highlight.plugins(require("onedarkpro.highlights.plugin").groups(theme))

    if override.highlights then
        highlight.custom(
            require("onedarkpro.utils.variable").replace_vars(
                vim.deepcopy(override.highlights),
                require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated)
            )
        )
    end

    return require("onedarkpro.main").load(theme)
end

---Get the color palette for a specific theme
---@param theme string
---@return table
function M.get_colors(theme)
    if vim.g.onedarkpro_colors and vim.g.onedarkpro_theme == theme then
        return vim.g.onedarkpro_colors
    end

    local theme = require("onedarkpro.theme").load(theme)
    return require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated, theme.meta)
end

return M
