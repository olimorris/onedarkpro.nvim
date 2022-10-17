local M = {}

local store = {
    highlights = require("onedarkpro.highlight").ft,
    default_highlights = {},
    filetypes = {},
    last_filetype = nil,
}

---Create a unique namespace for each filetype group
---@return nil
local function set_filetypes()
    for filetype, _ in pairs(store.highlights) do
        store.filetypes[filetype] = vim.api.nvim_create_namespace(filetype)
    end
end

---Map filetype highlights to their respective namespaces
---@return nil
local function set_highlights()
    for ft, ns in pairs(store.filetypes) do
        require("onedarkpro.lib.highlight").neovim_hl(store.highlights[ft], ns)
    end
end

---The autocmds which set the filetype highlights
-- @return function
local function set_autocmds()
    local augroup = vim.api.nvim_create_augroup("OnedarkproFiletypeHighlights", { clear = true })

    vim.api.nvim_create_autocmd("BufEnter,BufRead", {
        group = augroup,
        command = [[lua vim.schedule(function() require("onedarkpro.lib.ft_highlight").load() end)]],
    })
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = augroup,
        command = [[lua vim.schedule(function() require("onedarkpro.lib.ft_highlight").reset() end)]],
    })
end

---Determine if the filetype should be ignored
---@return boolean
local function ignore()
    local utils = require("onedarkpro.utils.collect")
    local config = require("onedarkpro.config").config

    local ft_ignore = config.ft_highlights_ignore.filetypes
    local buf_ignore = config.ft_highlights_ignore.buftypes

    return utils.pattern_match(ft_ignore, vim.bo.filetype) or utils.pattern_match(buf_ignore, vim.bo.buftype)
end

---Apply the highlight namespace for the filetype
---@param ns number namespace
---@param ft string filetype
---@return nil
local function apply_ns(ns, ft)
    store.last_filetype = ft

    local ok = pcall(vim.api.nvim__set_hl_ns, ns)
    if not ok then
        vim.api.nvim_set_hl_ns(ns)
    end
end

---Create the autocmds which trigger the application of filetype highlights
---@return nil
function M.create()
    set_filetypes()
    set_highlights()
    set_autocmds()
end

---Load the filetype highlights
---@return nil|function
function M.load()
    local ft = vim.bo.filetype

    if store.last_filetype == ft or ignore() then
        return
    end

    return apply_ns(store.filetypes[ft] and store.filetypes[ft] or 0, ft)
end

---Reset the highlights when the colorscheme changes
---@return nil
function M.reset()
    store.highlights = require("onedarkpro.highlight").ft
    set_highlights()
end

return M
