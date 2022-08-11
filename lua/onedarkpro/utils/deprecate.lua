---[[
--Courtesy of the awesome work in Nightfox.nvim
--https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/deprecation.lua
--]
local M = {
    _list = { { "onedarkpro.nvim\n", "Question" }, { "The following have been " }, { "deprecated:\n", "WarningMsg" } },
    _has_registered = false,
}

function M.write(...)
    for _, e in ipairs({ ... }) do
        table.insert(M._list, type(e) == "string" and { e } or e)
    end

    M._list[#M._list][1] = M._list[#M._list][1] .. "\n"

    if not M._has_registered then
        local augroup = vim.api.nvim_create_augroup("OnedarkproDeprecations", { clear = true })

        vim.api.nvim_create_autocmd("VimEnter", {
            group = augroup,
            once = true,
            command = [[lua require("onedarkpro.utils.deprecate").flush()]],
        })

        M._has_registered = true
    end
end

function M.flush()
    M.write("See ", { "https://github.com/olimorris/onedarkpro.nvim ", "Title" }, "for more information.")
    vim.api.nvim_echo(M._list, true, {})
end

return M
