local util = require("onedarkpro.utils")
local config = require("onedarkpro.config").config

local M = {}

---Form highlight groups based on the theme
---@param theme table
---@return table
function M.groups(theme)
    local palette = util.deep_extend(theme.palette, theme.generated)

    local editor = require("onedarkpro.highlights.editor").groups(theme)
    local syntax = require("onedarkpro.highlights.syntax").groups(theme)
    local plugins = require("onedarkpro.highlights.plugin").groups(theme)
    local filetypes = require("onedarkpro.highlights.filetype").groups(theme)
    local semantic_tokens = util.replace_vars(config.semantic_tokens.default, palette)

    -- Semantic tokens take priority over plugins and filetypes
    local groups = util.deep_replace(util.deep_extend(editor, syntax, plugins, filetypes), semantic_tokens)

    -- But highlight groups take priority over everything
    if config.highlights then
        local custom = util.replace_vars(vim.deepcopy(config.highlights), palette)
        groups = util.deep_replace(groups, custom)
    end

    return groups
end

return M
