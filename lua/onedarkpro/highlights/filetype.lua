local M = {}

---Get the highlight groups for filetype highlights
---@return table|nil
function M.groups()
    if not require("onedarkpro.utils").has_nvim_08 then
        return
    end

    local theme = require("onedarkpro.theme").theme
    local config = require("onedarkpro.config").config

    local groups = {}
    local filetypes = config.filetypes

    local function load_filetype(filetype)
        if filetype == "all" then
            return
        end
        groups = vim.tbl_deep_extend("force", groups, require("onedarkpro.highlights.filetypes." .. filetype).groups(theme))
    end

    for filetype, load in pairs(filetypes) do
        if load then
            load_filetype(filetype)
        end
    end

    return groups
end

return M
