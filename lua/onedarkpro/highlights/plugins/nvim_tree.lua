local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        NvimTreeNormalNC = { -- Color when nvim-tree is no longer in focus
            bg = config.options.transparency and "NONE"
                or (config.options.highlight_inactive_windows and theme.generated.color_column or theme.palette.bg),
        },
        NvimTreeSymlink = { fg = theme.palette.cyan },
        NvimTreeFolderName = { fg = theme.palette.blue },
        NvimTreeRootFolder = { fg = theme.palette.purple },
        NvimTreeFolderIcon = { fg = theme.palette.purple },
        NvimTreeEmptyFolderName = { fg = theme.palette.gray },
        NvimTreeOpenedFolderName = { fg = theme.palette.purple },
        NvimTreeExecFile = { fg = theme.palette.green },
        NvimTreeOpenedFile = { fg = theme.palette.purple },
        NvimTreeSpecialFile = { link = "Special" },
        -- NvimTreeImageFile = {},
        NvimTreeMarkdownFile = { fg = theme.palette.red },
        NvimTreeIndentMarker = { fg = theme.palette.gray },
        NvimTreeCursorLine = { bg = theme.palette.gray },

        NvimTreeLicenseIcon = { fg = theme.palette.yellow },
        NvimTreeYamlIcon = { fg = theme.palette.yellow },
        NvimTreeTomlIcon = { fg = theme.palette.yellow },
        NvimTreeGitignoreIcon = { fg = theme.palette.red },
        NvimTreeJsonIcon = { fg = theme.palette.green },

        NvimTreeLuaIcon = { fg = theme.palette.blue },
        NvimTreePythonIcon = { fg = theme.palette.yellow },
        NvimTreeShellIcon = { fg = theme.palette.fg },
        NvimTreeJavascriptIcon = { fg = theme.palette.yellow },
        NvimTreeCIcon = { fg = theme.palette.blue },
        NvimTreeReactIcon = { fg = theme.palette.blue },
        NvimTreeHtmlIcon = { fg = theme.palette.red },
        NvimTreeRustIcon = { fg = theme.palette.fg },
        NvimTreeTypescriptIcon = { fg = theme.palette.blue },
        NvimTreeVimIcon = { fg = theme.palette.green },

        NvimTreeGitDirty = { fg = theme.palette.red },
        NvimTreeGitStaged = { fg = theme.palette.yellow },
        NvimTreeGitMerge = { fg = theme.palette.cyan },
        NvimTreeGitRenamed = { fg = theme.palette.yellow },
        NvimTreeGitNew = { fg = theme.palette.green },
        NvimTreeGitDeleted = { fg = theme.palette.red },
    }
end

return M
