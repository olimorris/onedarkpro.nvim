local M = {}

---Set the highlight groups for plugin highlights
---@param theme table
---@return table|nil
function M.groups(theme)
    local config = require("onedarkpro.config").config

    local groups = {}
    local plugins = config.plugins

    local function load_plugin(plugin)
        if plugin == "all" then
            return
        end
        groups = vim.tbl_deep_extend("force", groups, require("onedarkpro.highlights.plugins." .. plugin).groups(theme))
    end

    for plugin, load in pairs(plugins) do
        if load then
            load_plugin(plugin)
        end
    end

    return groups
end

return M
