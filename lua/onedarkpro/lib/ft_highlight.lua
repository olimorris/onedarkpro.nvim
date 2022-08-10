local M = {}

local store = {
    highlights = require("onedarkpro.highlight").ft,
    has_been_applied = false,
    default_highlights = {},
    filetypes = {},
    last_filetype = nil,
}

---Create a unique namespace for each individual filetype
---@return nil
local function set_filetypes()
    for filetype, _ in pairs(store.highlights) do
        store.filetypes[filetype] = vim.api.nvim_create_namespace(filetype)
    end
end

---Set the filetype highlights in their own custom namespace
---@return nil
local function set_highlights()
    for ft, ns in pairs(store.filetypes) do
        require("onedarkpro.lib.highlight").neovim_hl(store.highlights[ft], ns)
    end
end

---Set autocommands to async trigger the highlights
-- @return function
local function set_autocmds()
    local autocmds = {
        onedarkpro_theme_autocmds = {
            -- TODO: add additional events such as BufFilePost, BufDelete
            {
                "BufEnter,BufRead",
                "*",
                'lua vim.schedule(function() require("onedarkpro.lib.ft_highlight").load() end)',
            },
            {
                "ColorScheme",
                "*",
                'lua vim.schedule(function() require("onedarkpro.lib.ft_highlight").reset() end)',
            },
        },
    }

    return require("onedarkpro.utils.commands").create(autocmds)
end

---Apply the highlight namespace for the filetype
---@param ns number
---@param ft string
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

    if store.last_filetype == ft then
        return
    end

    if store.filetypes[ft] == nil then
        store.has_been_applied = false
        apply_ns(0, ft)
    end

    if store.filetypes[ft] then
        store.has_been_applied = true
        apply_ns(store.filetypes[ft], ft)
    end
end

---Reset the highlights when the colorscheme changes
---@return nil
function M.reset()
    store.highlights = require("onedarkpro.highlight").ft
    M.create()
end

return M
