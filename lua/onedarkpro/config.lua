local M = {}
M.user_opts = {}

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
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
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

---Determine the filetypes or plugins that should be loaded
---@param files table
---@param override table
---@return table
local function load_files(files, override)
    for file, _ in pairs(files) do
        if override["all"] == false then
            files[file] = false
        end
        if override[file] then
            files[file] = override[file]
        end
    end

    return files
end

---Setup the theme's as per the configuration
---@return table
function M.setup()
    local utils = require("onedarkpro.utils.collect")
    local logger = require("onedarkpro.utils.logging")

    M.config = utils.deep_extend(vim.deepcopy(defaults), M.user_opts)

    M.config.options = set_options(M.config.options)
    logger.debug("CONFIG: Set options")

    if M.user_opts.filetypes then
        M.config.filetypes = load_files(M.config.filetypes, M.user_opts.filetypes)
        logger.debug("CONFIG: Set filetypes")
    end

    if M.user_opts.plugins then
        M.config.plugins = load_files(M.config.plugins, M.user_opts.plugins)
        logger.debug("CONFIG: Set plugins")
    end

    return M.config
end

return M
