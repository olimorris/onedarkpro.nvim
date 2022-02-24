local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        packerFail = { fg = theme.colors.red }, -- Icon when install/update fails
        packerSuccess = { fg = theme.colors.green }, -- Icon when install/update is a success
        packerWorking = { fg = theme.colors.yellow }, -- Icon when syncing
        packerOutput = { fg = theme.colors.blue }, -- Text beneath plugin title (e.g. Commits)
        packerStatusFail = { fg = theme.colors.red },
        packerStatusSuccess = { fg = theme.colors.green }, -- Plugin name when install/update is a success
    }
end

return M
