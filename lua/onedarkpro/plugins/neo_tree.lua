local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        NeoTreeNormalNC = { -- Color when nvim-tree is no longer in focus
            bg = theme.config.options.transparency and theme.options.transparency
                or (theme.config.options.window_unfocussed_color and theme.colors.color_column or theme.colors.bg),
        },
        NeoTreeSymbolicLinkTarget = {
            fg = theme.colors.cyan,
            style = theme.options.underline,
        },
        NeoTreeDirectoryName = { fg = theme.colors.blue },
        NeoTreeDirectoryIcon = { fg = theme.colors.purple },
        NeoTreeRootName = {
            fg = theme.colors.purple,
            style = theme.options.bold,
        },
        NeoTreeFileIcon = {
            fg = theme.colors.blue,
        },
        NeoTreeFileName = {
            fg = theme.colors.fg,
        },
        NeoTreeFileNameOpened = {
            fg = theme.colors.purple,
            style = theme.options.italic,
        },
        NeoTreeIndentMarker = { fg = theme.colors.gray },
        NeoTreeTitleBar = { fg = theme.colors.bg, bg = theme.colors.purple },
        NeoTreeFloatTitle = { fg = theme.colors.bg, bg = theme.colors.purple },

        NeoTreeGitAdded = { fg = theme.colors.green },
        NeoTreeGitConflict = { fg = theme.colors.blue },
        NeoTreeGitDeleted = { fg = theme.colors.red },
        NeoTreeGitModified = { fg = theme.colors.yellow },
        NeoTreeGitIgnored = { fg = theme.colors.gray },
        NeoTreeGitUntracked = { fg = theme.colors.gray },

        NeoTreeModified = { fg = theme.colors.red },
    }
end

return M
