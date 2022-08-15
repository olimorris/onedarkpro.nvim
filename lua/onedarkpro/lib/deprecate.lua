local M = {
    checked = false,
}

---Check for deprecations in the user's config
---@param opts table  User's config
---@return nil
function M.check(opts)
    if M.checked then
        return
    end

    local dep = require("onedarkpro.utils.deprecate")
    local utils = require("onedarkpro.utils.init")

    -- if opts.hlgroups then
    --     dep.write("  ", { "hlgroups", "WarningMsg" }, " has been renamed to ", { "highlights", "WarningMsg" })
    -- end
    -- if opts.filetype_hlgroups then
    --     dep.write(
    --         "  ",
    --         { "filetype_hlgroups", "WarningMsg" },
    --         " has been renamed to ",
    --         { "ft_highlights", "WarningMsg" }
    --     )
    -- end
    if (opts.filetype_hlgroups or opts.ft_highlights) and not utils.use_nvim_api then
        dep.write("  ", { "filetype highlights", "Error" }, " now require ", { "Neovim 0.7+", "Error" })
    end

    M.checked = true
end

return M
