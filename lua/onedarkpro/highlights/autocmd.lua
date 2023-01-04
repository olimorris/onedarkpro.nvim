local config = require("onedarkpro.config").config

local M = {}

-- Link the autocmds to their respective config options
-- TODO: Consider a better way to do this (move out of options to an autocmd config setting?!)
local autocmd_files = {
    highlight_inactive_windows = config.options.highlight_inactive_windows,
}

---Set the autocmds for the colorscheme
---@param theme table
---@return string
function M.autocmds(theme)
    local autocmds = {}

    local au = [[vim.cmd("au %s * %s")]]
    local augroup = [[
vim.cmd("augroup OneDarkPro")
vim.cmd("au!")
%s
vim.cmd("augroup END")
    ]]

    local function load(autocmd)
        return require("onedarkpro.highlights.autocmds." .. autocmd)
    end

    for file, enabled in pairs(autocmd_files) do
        if enabled then
            for _, autocmd in ipairs(load(file).autocmd(theme)) do
                table.insert(autocmds, string.format(au, autocmd[1], autocmd[2]))
            end
        end
    end

    return string.format(augroup, table.concat(autocmds))
end

return M
