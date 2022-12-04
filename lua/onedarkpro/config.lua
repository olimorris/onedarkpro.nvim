local util = require("onedarkpro.utils")

local M = { theme = "onedark", is_setup = false }

local defaults = {
    caching = true, -- Enable caching
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro"), -- The path to the cache directory
    cache_suffix = "_compiled",
    colors = {}, -- Override default colors
    highlights = {}, -- Override default highlight groups
    filetypes = { -- Enable/Disable specific plugins
        javascript = true,
        lua = true,
        markdown = true,
        php = true,
        python = true,
        ruby = true,
        rust = true,
        toml = true,
        typescript = true,
        typescriptreact = true,
        vue = true,
        yaml = true,
    },
    plugins = { -- Enable/Disable specific plugins
        aerial = true,
        barbar = true,
        copilot = true,
        dashboard = true,
        gitsigns = true,
        glance = true,
        hop = true,
        indentline = true,
        leap = true,
        lsp_saga = true,
        marks = true,
        native_lsp = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
        nvim_navic = true,
        nvim_notify = true,
        nvim_tree = true,
        nvim_ts_rainbow = true,
        op_nvim = true,
        packer = true,
        polygot = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = true,
        which_key = true,
    },
    styles = {
        types = "NONE", -- Style that is applied to types
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        constants = "NONE", -- Style that is applied to constants
        functions = "NONE", -- Style that is applied to functions
        operators = "NONE", -- Style that is applied to operators
        variables = "NONE", -- Style that is applied to variables
        conditionals = "NONE", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
        bold = true, -- Use bold styles?
        italic = true, -- Use italic styles?
        underline = true, -- Use underline styles?
        undercurl = true, -- Use undercurl styles?

        cursorline = false, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    },
}

M.config = vim.deepcopy(defaults)

---Set the theme's options
---@param opts table
---@return table
local function set_options(opts)
    if opts.cursorline then vim.wo.cursorline = true end

    return {
        none = "NONE",
        bold = opts.bold and "bold" or "NONE",
        italic = opts.italic and "italic" or "NONE",
        undercurl = opts.undercurl and "undercurl" or "NONE",
        underline = opts.underline and "underline" or "NONE",
        undercurl_underline = (opts.undercurl and opts.underline) and "underline,undercurl" or "NONE",
        bold_italic = (opts.bold and opts.italic) and "bold,italic" or "NONE",
        cursorline = opts.cursorline,
        transparency = opts.transparency,
        terminal_colors = opts.terminal_colors,
        highlight_inactive_windows = opts.highlight_inactive_windows or opts.window_unfocused_color,
    }
end

---Determine the filetypes or plugins that should be loaded
---@param files table
---@param override table
---@return table
local function load_files(files, override)
    for f, _ in pairs(files) do
        if override["all"] == false then files[f] = false end
        if override[f] then files[f] = override[f] end
    end

    return files
end

---Set the theme to use
---@param theme string
---@return nil
function M.set_theme(theme)
    M.theme = theme
end

---Reset the config to the default values
---@return nil
function M.reset()
    M.config = util.deep_copy(defaults)
end

---Setup the configuration for the theme
---@param opts? table
---@return nil
function M.setup(opts)
    opts = opts or {}
    M.config = util.deep_extend(M.config, opts)
    M.config.options = set_options(M.config.options)

    --TODO: Remove this when we remove dark_theme and light_theme from the config
    if not M.theme then
        if vim.o.background == "dark" then
            M.theme = M.config.dark_theme or "onedark"
        else
            M.theme = M.config.light_theme or "onelight"
        end
    end
    --//------------------------------------------------------------------------

    if opts and opts.filetypes then M.config.filetypes = load_files(M.config.filetypes, opts.filetypes) end

    if opts and opts.plugins then M.config.plugins = load_files(M.config.plugins, opts.plugins) end

    M.is_setup = true
end

---Get information relating to where the cache is stored
---@param opts? table
---@return string,string
function M.get_cached_info(opts)
    local file = require("onedarkpro.utils.file")

    opts = opts or {}

    local theme = opts.theme or M.theme
    local cache_path = opts.cache_path or M.config.cache_path
    local theme_path = file.join_paths(cache_path, theme .. M.config.cache_suffix)

    return cache_path, theme_path
end

---Create a hash from the config
---@return string
function M.hash()
    local hash = require("onedarkpro.lib.hash").hash(M.config)
    return hash and hash or 0
end

return M
