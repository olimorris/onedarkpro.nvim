local config = require("onedarkpro.config")

local M = {}

---Set the highlight groups for plugin highlights
---@param theme table
---@return table
function M.groups(theme)
    local groups = {}

    local function load_plugin(plugin)
        -- Exclude the "all" key
        if plugin == "all" then return end
        groups = vim.tbl_deep_extend("force", groups, require("onedarkpro.highlights.plugins." .. plugin).groups(theme))
    end

    for plugin, enabled in pairs(config.plugins) do
        if enabled then load_plugin(plugin) end
    end

    return groups
end

return M
