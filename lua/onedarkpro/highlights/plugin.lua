local M = {}

---Get the highlight groups for plugin highlights
---@param theme table
---@param config table
---@return table|nil
function M.groups(theme, config)
    local groups = {}
    local plugins = config.plugins

    local function load_plugin(plugin)
        if plugin == "all" then
            return
        end
        groups = vim.tbl_deep_extend("force", groups, require("onedarkpro.highlights.plugins." .. plugin).groups(theme, config))
    end

    for plugin, load in pairs(plugins) do
        if load then
            load_plugin(plugin)
        end
    end

    return groups
end

return M
