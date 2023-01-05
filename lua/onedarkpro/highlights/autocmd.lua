local config = require("onedarkpro.config").config

local M = {}

-- Link the autocmds files and their respective conditional
local autocmd_files = {
    highlight_inactive_windows = config.options.highlight_inactive_windows,
}

--- Load an autocmd file
---@param autocmd string
---@return table
local function load(autocmd)
    return require("onedarkpro.highlights.autocmds." .. autocmd)
end

--- Set the autocmds for the colorscheme
---@param theme table
---@return string
function M.autocmds(theme)
    local autocmds = {}
    for file, enabled in pairs(autocmd_files) do
        if enabled then
            for _, autocmd in ipairs(load(file).autocmd(theme)) do
                table.insert(autocmds, string.format([[vim.cmd("au %s %s %s")]], autocmd[1], autocmd[2], autocmd[3]))
            end
        end
    end

    return string.format(
        [[
vim.cmd("augroup OneDarkPro")
vim.cmd("au!")
%s
vim.cmd("augroup END")
    ]],
        table.concat(autocmds, "\n")
    )
end

return M
