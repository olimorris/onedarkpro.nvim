local M = { theme = "onedark", is_setup = false }

local defaults = {
    cache_suffix = "_cached",
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro"), -- The path to the cache directory
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
        window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    },
}

---Set the theme's options
---@param opts table
---@return table
local function set_options(opts)
    if opts.cursorline then
        vim.wo.cursorline = true
    end

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
        window_unfocused_color = opts.window_unfocused_color,
    }
end

---Determine if the files should be loaded
---@param files table
---@return table
local function load_files(files)
    local list = vim.deepcopy(files)

    for file, _ in pairs(files) do
        if files["all"] == false then
            files[file] = false
        end
        if list[file] then
            list[file] = files[file]
        end
    end

    return list
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
    M.config = vim.deepcopy(defaults)
end

---Setup the configuration for the theme
---@param opts? table
---@return nil
function M.setup(opts)
    local utils = require("onedarkpro.utils")
    opts = utils.deep_extend(defaults, opts) or vim.deepcopy(defaults)
    opts.options = set_options(opts.options)

    --TODO: Remove this when we remove dark_theme and light_theme from the config
    if not M.theme then
        if vim.o.background == "dark" then
            M.theme = opts.dark_theme or "onedark"
        else
            M.theme = opts.light_theme or "onelight"
        end
    end
    --//------------------------------------------------------------------------

    if opts.filetypes then
        opts.filetypes = load_files(opts.filetypes)
    end

    if opts.plugins then
        opts.plugins = load_files(opts.plugins)
    end

    M.is_setup = true
    M.config = opts
end

---Get information relating to where the cache is stored
---@param opts? table
---@return string,string
function M.get_cached_info(opts)
    local utils = require("onedarkpro.utils")

    local theme = opts and opts.theme or M.theme
    local cache_path = opts and opts.cache_path or M.config.cache_path

    return cache_path, utils.join_paths(cache_path, theme .. M.config.cache_suffix)
end

return M
