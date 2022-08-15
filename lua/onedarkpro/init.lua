local M = {}

local override = {}

function override.colors(colors)
    require("onedarkpro.override").colors = colors
end

function override.highlights(highlights)
    require("onedarkpro.override").highlights = highlights
end

function override.ft_highlights(highlights)
    require("onedarkpro.override").ft_highlights = highlights
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

    if opts.filetype_hlgroups then
        override.ft_highlights(opts.filetype_hlgroups)
    end

    require("onedarkpro.lib.deprecate").check(opts)
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

function highlight.apply(highlights, theme)
    return require("onedarkpro.utils.variable").replace_vars(
        vim.deepcopy(highlights),
        require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated)
    )
end

function highlight.custom(highlights)
    require("onedarkpro.highlight").custom = highlights
end

function highlight.ft(highlights)
    require("onedarkpro.highlight").ft = highlights
end

M.highlight = highlight

---Load the theme
---@return nil
function M.load()
    local theme = require("onedarkpro.theme").load()
    override = require("onedarkpro.override")

    highlight.editor(require("onedarkpro.highlights.editor").groups(theme))
    highlight.syntax(require("onedarkpro.highlights.syntax").groups(theme))
    highlight.plugins(require("onedarkpro.highlights.plugin").groups(theme))

    if override.highlights then
        highlight.custom(highlight.apply(override.highlights, theme))
    end

    if override.ft_highlights then
        highlight.ft(highlight.apply(override.ft_highlights, theme))
    end

    return require("onedarkpro.main").load(theme)
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

return M
