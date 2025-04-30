local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
        MCPHubNormal = { link = "Normal" },
        MCPHubTitle = { fg = theme.palette.green },
        MCPHubHeader = { fg = theme.palette.purple },
        MCPHubHeaderShortcut = { fg = theme.palette.purple },
        MCPHubHeaderBtn = { bg = theme.palette.purple, fg = theme.palette.bg, bold = true },
        MCPHubHeaderBtnShortcut = { bg = theme.palette.purple, fg = theme.palette.bg, bold = true },
        MCPHubMuted = { link = "Comment" },
        MCPHubInfo = { fg = theme.palette.fg },
        MCPHubSuccessFill = { bg = theme.palette.green, fg = theme.palette.bg },
        MCPHubHeaderAccent = { bg = theme.palette.purple, fg = theme.palette.bg },

        MCPHubSuccess = { fg = theme.palette.green },
        MCPHubError = { fg = theme.palette.red },
        MCPHubActiveItem = { bg = theme.palette.blue, fg = theme.palette.bg },
    }
end

return M
