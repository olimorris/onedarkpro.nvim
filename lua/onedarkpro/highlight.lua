local utils = require("onedarkpro.utils")
local override = require("onedarkpro.override")

local M = {}

---Form highlight groups based on the theme
---@param theme table
---@return table
function M.groups(theme)
    local editor = require("onedarkpro.highlights.editor").groups(theme)
    local syntax = require("onedarkpro.highlights.syntax").groups(theme)
    local plugins = require("onedarkpro.highlights.plugin").groups(theme)
    local filetypes = require("onedarkpro.highlights.filetype").groups(theme)

    local groups = utils.deep_extend(editor, syntax, plugins, filetypes)

    if override.highlights then
        local custom =
            utils.replace_vars(vim.deepcopy(override.highlights), utils.deep_extend(theme.palette, theme.generated))
        groups = utils.deep_replace(groups, custom)
    end

    return groups
end

return M
