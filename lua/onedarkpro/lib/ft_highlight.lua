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

local function ignore(ft)
    local bt = vim.bo.buftype
    local utils = require("onedarkpro.utils.collect")
    local config = require("onedarkpro.config").config
    require('pl.pretty').dump(config.filetype_hlgroups_ignore.filetypes)

    -- require('pl.pretty').dump(config.filetype_hlgroups_ignore.fileypes)

    return utils.pattern_match(config.filetype_hlgroups_ignore.buftypes, bt)
        or utils.pattern_match(config.filetype_hlgroups_ignore.fileypes, ft)
end

---Apply the highlight namespace for the filetype
---@param ns number namespace
---@param ft string filetype
---@return function
local function apply_ns(ns, ft)
    store.last_filetype = ft
    return vim.api.nvim__set_hl_ns(ns)
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

    -- if ignore(ft) then
    --     return
    -- end

    if store.last_filetype == ft then
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
