local config = require("onedarkpro.config")

local M = {}

---Set the highlight groups for filetype highlights
---@param theme table
---@return table|nil
function M.groups(theme)
    local groups = {}

    local function load_filetype(filetype)
        -- Exclude the "all" key
        if filetype == "all" then return end
        groups =
            vim.tbl_deep_extend("force", groups, require("onedarkpro.highlights.filetypes." .. filetype).groups(theme))
    end

    for filetype, enabled in pairs(config.filetypes) do
        if enabled then load_filetype(filetype) end
    end

    return groups
end

return M
