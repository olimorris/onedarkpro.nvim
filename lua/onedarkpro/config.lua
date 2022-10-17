local utils = require("onedarkpro.utils.collect")
local M = {}

-- Default options for the theme
local defaults = {
    dark_theme = "onedark", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    theme = function()
        if vim.o.background == "dark" then
            return M.config.dark_theme
        else
            return M.config.light_theme
        end
    end,
    caching = false, -- Use caching for the theme?
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
    colors = {}, -- Override default colors
    highlights = {}, -- Override default highlight groups
    ft_highlights = {}, -- Override default highlight groups for specific filetypes
    ft_highlights_ignore = { -- Filetypes which are ignored when applying filetype highlight groups
        filetypes = {
            "^aerial$",
            "^alpha$",
            "^frecency$",
            "^fugitive$",
            "^fugitiveblame$",
            "^help$",
            "^minimap$",
            "^neotest--summary$",
            "^neo--tree$",
            "^neo--tree--popup$",
            "^NvimTree$",
            "^packer$",
            "^qf$",
            "^startify$",
            "^startuptime$",
            "^TelescopePrompt$",
            "^terminal$",
            "^toggleterm$",
            "^undotree$",
        },
        buftypes = { "^terminal$" },
    },
    filetypes = { -- Enable/Disable specific plugins
        javascript = true,
        lua = true,
        markdown = true,
        php = true,
        python = true,
        ruby = true,
        rust = true,
        toml = true,
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
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    },
    log_level = "error", -- The log level: "trace", "debug", "info", "warn", "error"
    mute_deprecations = false, -- Don't show deprecation warnings for the *older* filetype highlights
}

---Set the theme's options
---@return table
local function set_options(opts)
    if not opts then
        opts = defaults
    end

    if opts.cursorline then
        vim.wo.cursorline = true
    end

    M.config.options = {
        bold = opts.bold and "bold" or "NONE",
        italic = opts.italic and "italic" or "NONE",
        undercurl = opts.undercurl and "undercurl" or "NONE",
        underline = opts.underline and "underline" or "NONE",
        undercurl_underline = (opts.undercurl and opts.underline) and "underline,undercurl" or "NONE",
        bold_italic = (opts.bold and opts.italic) and "bold,italic" or "NONE",
        cursorline = opts.cursorline,
        transparency = opts.transparency,
        terminal_colors = opts.terminal_colors,
        window_unfocused_color = opts.window_unfocused_color
    }

    return M.config.options
end

---Load files based on the user's config
---@param files table
---@param user_config table
---@return nil
local function load_files(files, user_config)
    for file, _ in pairs(files) do
        if user_config["all"] == false then
            files[file] = false
        end
        if user_config[file] then
            files[file] = user_config[file]
        end
    end
end

M.config = vim.deepcopy(defaults)

---Apply the users custom config on top of the default
---@param opts table
---@return nil
function M.setup(opts)
    opts = opts or {}
    M.config = utils.deep_extend(defaults, opts)

    if opts.filetypes then
        load_files(M.config.filetypes, opts.filetypes)
    end

    if opts.plugins then
        load_files(M.config.plugins, opts.plugins)
    end
end

---A user may load the colorscheme without the setup function. This ensures that
---any options (which are essential to filetype highlights) are set and also
---returns the default configuration as a table for later consumption
---@return table|nil
function M.init()
    if vim.g.onedarkpro_config_set then
        return M.config
    end

    set_options(M.config.options)
    vim.g.onedarkpro_config_set = true

    return M.config
end

return M
