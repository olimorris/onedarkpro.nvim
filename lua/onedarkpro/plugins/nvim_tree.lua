local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        NvimTreeNormalNC = { -- Color when nvim-tree is no longer in focus
            bg = theme.config.options.transparency and theme.options.transparency
                or (theme.config.options.window_unfocussed_color and theme.colors.color_column or theme.colors.bg),
        },
        NvimTreeSymlink = {
            fg = theme.colors.cyan,
            style = theme.options.underline,
        },
        NvimTreeFolderName = { fg = theme.colors.blue },
        NvimTreeRootFolder = {
            fg = theme.colors.purple,
            style = theme.options.bold,
        },
        NvimTreeFolderIcon = { fg = theme.colors.purple },
        NvimTreeEmptyFolderName = { fg = theme.colors.comment },
        NvimTreeOpenedFolderName = { fg = theme.colors.purple },
        NvimTreeExecFile = { fg = theme.colors.green, style = theme.options.bold },
        NvimTreeOpenedFile = {
            fg = theme.colors.purple,
            style = theme.options.italic,
        },
        NvimTreeSpecialFile = { link = "Special" },
        -- NvimTreeImageFile = {},
        NvimTreeMarkdownFile = { fg = theme.colors.red },
        NvimTreeIndentMarker = { fg = theme.colors.gray },

        NvimTreeLicenseIcon = { fg = theme.colors.yellow },
        NvimTreeYamlIcon = { fg = theme.colors.yellow },
        NvimTreeTomlIcon = { fg = theme.colors.yellow },
        NvimTreeGitignoreIcon = { fg = theme.colors.red },
        NvimTreeJsonIcon = { fg = theme.colors.green },

        NvimTreeLuaIcon = { fg = theme.colors.blue },
        NvimTreePythonIcon = { fg = theme.colors.yellow },
        NvimTreeShellIcon = { fg = theme.colors.fg },
        NvimTreeJavascriptIcon = { fg = theme.colors.yellow },
        NvimTreeCIcon = { fg = theme.colors.blue },
        NvimTreeReactIcon = { fg = theme.colors.blue },
        NvimTreeHtmlIcon = { fg = theme.colors.red },
        NvimTreeRustIcon = { fg = theme.colors.fg },
        NvimTreeTypescriptIcon = { fg = theme.colors.blue },
        NvimTreeVimIcon = { fg = theme.colors.green },

        NvimTreeGitDirty = { fg = theme.colors.red },
        NvimTreeGitStaged = { fg = theme.colors.yellow },
        NvimTreeGitMerge = { fg = theme.colors.cyan },
        NvimTreeGitRenamed = { fg = theme.colors.yellow },
        NvimTreeGitNew = { fg = theme.colors.green },
        NvimTreeGitDeleted = { fg = theme.colors.red },
    }
end

return M
