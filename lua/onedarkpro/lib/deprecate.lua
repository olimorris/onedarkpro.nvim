local M = {
    checked = false,
}

---Check for deprecations in the user's config
---@param opts table  User's config
---@return nil
function M.check(opts)
    if M.checked or require("onedarkpro.config").config.mute_deprecations then
        return
    end

    local dep = require("onedarkpro.utils.deprecate")
    local utils = require("onedarkpro.utils.init")

    if opts.hlgroups then
        dep.write("  ", { "hlgroups", "WarningMsg" }, " has been renamed to ", { "highlights", "WarningMsg" })
    end
    if opts.filetype_hlgroups then
        dep.write(
            "  ",
            { "filetype_hlgroups", "WarningMsg" },
            " has been renamed to ",
            { "ft_highlights", "WarningMsg" }
        )
    end
    if opts.filetype_hlgroups_ignore then
        dep.write(
            "  ",
            { "filetype_hlgroups_ignore", "WarningMsg" },
            " has been renamed to ",
            { "ft_highlights_ignore", "WarningMsg" }
        )
    end
    if opts.ft_highlights or opts.filetype_hlgroups then
        dep.write(
            "  ",
            { "Filetype highlights", "WarningMsg" },
            " - They are now built into the plugin. Please see the appropriate section in the README"
        )
    end
    if opts.options and opts.options.window_unfocussed_color then
        dep.write(
            "  ",
            { "window_unfocussed_color", "WarningMsg" },
            " has been renamed to ",
            { "window_unfocused_color", "WarningMsg" }
        )
    end
    if opts.options and opts.options.highlight_cursorline then
        dep.write(
            "  ",
            { "highlight_cursorline", "WarningMsg" },
            " has been renamed to ",
            { "cursorline", "WarningMsg" }
        )
    end
    if opts.options and opts.options.transparent then
        dep.write(
            "  ",
            { "transparent", "WarningMsg" },
            " has been renamed to ",
            { "transparency", "WarningMsg" }
        )
    end

    if (opts.filetype_hlgroups or opts.ft_highlights) and not utils.use_nvim_api then
        dep.write("  ", { "filetype highlights", "Error" }, " now require ", { "Neovim 0.7+", "Error" })
    end

    M.checked = true
end

return M
