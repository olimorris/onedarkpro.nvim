local M = {}

function M.groups(theme)
    if not require("onedarkpro.utils").use_filetype_highlights then
        return
    end

    local groups = {}
    local filetypes = require("onedarkpro.config").config.filetypes

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
