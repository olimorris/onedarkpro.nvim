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
    local utils = require("onedarkpro.utils")

    if (opts.filetype_hlgroups or opts.ft_highlights) and not utils.has_nvim_07 then
        dep.write("  ", { "filetype highlights", "Error" }, " now require ", { "Neovim 0.7+", "Error" })
    end

    if opts.filetype_hlgroups or opts.ft_highlights then
        dep.write(
            "  ",
            { "filetype highlights", "Error" },
            " will soon be deprecated. Please consider using the new filetype highlights "
        )
    end

    M.checked = true
end

return M
