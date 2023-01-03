local util = require("onedarkpro.utils")
local config = require("onedarkpro.config").config

local M = {}

---Form highlight groups based on the theme
---@param theme table
---@return table
function M.groups(theme)
    local editor = require("onedarkpro.highlights.editor").groups(theme)
    local syntax = require("onedarkpro.highlights.syntax").groups(theme)
    local plugins = require("onedarkpro.highlights.plugin").groups(theme)
    local filetypes = require("onedarkpro.highlights.filetype").groups(theme)

    local groups = util.deep_extend(editor, syntax, plugins, filetypes)

    if config.highlights then
        local custom =
            util.replace_vars(vim.deepcopy(config.highlights), util.deep_extend(theme.palette, theme.generated))
        groups = util.deep_extend(groups, custom)
    end

    return groups
end

return M
