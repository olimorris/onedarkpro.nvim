local util = require("onedarkpro.utils")

local defaults = {
    caching = true, -- Enable caching
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro"), -- The path to the cache directory
    cache_suffix = "_compiled",
    debug = false,
    colors = {}, -- Add/override colors
    highlights = {}, -- Add/override highlights
    themes = {
        onedark = "onedark",
        onelight = "onelight",
        onedark_vivid = "onedark_vivid",
        onedark_dark = "onedark_dark",
        vaporwave = "vaporwave",
    },
    styles = {
        tags = "NONE", -- Style that is applied to tags
        types = "NONE", -- Style that is applied to types
        methods = "NONE", -- Style that is applied to methods
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        constants = "NONE", -- Style that is applied to constants
        functions = "NONE", -- Style that is applied to functions
        operators = "NONE", -- Style that is applied to operators
        variables = "NONE", -- Style that is applied to variables
        parameters = "NONE", -- Style that is applied to parameters
        conditionals = "NONE", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    filetypes = { -- Enable/disable specific plugins
        c = true,
        comment = true,
        go = true,
        html = true,
        java = true,
        javascript = true,
        json = true,
        latex = true,
        lua = true,
        markdown = true,
        php = true,
        python = true,
        ruby = true,
        rust = true,
        scss = true,
        toml = true,
        typescript = true,
        typescriptreact = true,
        vue = true,
        xml = true,
        yaml = true,
    },
    plugins = { -- Enable/disable specific plugins
        aerial = true,
        barbar = true,
        blink_cmp = true,
        codecompanion = true,
        copilot = true,
        csvview = true,
        dashboard = true,
        diffview = true,
        flash_nvim = true,
        gitgraph_nvim = true,
        gitsigns = true,
        hop = true,
        indentline = true,
        leap = true,
        lsp_saga = true,
        lsp_semantic_tokens = true,
        marks = true,
        mason = true,
        mcphub = true,
        mini_diff = true,
        mini_icons = true,
        mini_indentscope = true,
        mini_test = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
        nvim_lsp = true,
        nvim_navic = true,
        nvim_notify = true,
        nvim_tree = true,
        nvim_ts_rainbow = true,
        nvim_ts_rainbow2 = true,
        op_nvim = true,
        packer = true,
        persisted = true,
        polygot = true,
        rainbow_delimiters = true,
        render_markdown = true,
        snacks = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = true,
        which_key = true,
        vim_dadbod_ui = true,
    },
    options = {
        cursorline = false, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        lualine_transparency = false, -- Center bar transparency?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
    },
}

local M = { theme = "onedark", config = vim.deepcopy(defaults), is_setup = false }

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

---Get information relating to where the cache is stored
---@param opts? table
---@return string,string
function M.get_cached_info(opts)
    opts = opts or {}

    local theme = opts.theme or M.theme
    local cache_path = opts.cache_path or M.config.cache_path
    local theme_path = util.join_paths(cache_path, theme .. M.config.cache_suffix)

    return cache_path, theme_path
end

---Create a hash from the config
---@return string|number
function M.hash()
    local hash = require("onedarkpro.lib.hash").hash(M.config)
    return hash and hash or 0
end

---Setup the configuration for the theme
---@param opts? table
---@return nil
function M.setup(opts)
    opts = opts or {}

    M.config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts)

    if opts.themes then
        M.config.themes = defaults.themes
        vim.iter(opts.themes):each(function(name, theme)
            M.config.themes[name] = theme
        end)
    end

    if M.config.options.cursorline then vim.wo.cursorline = true end
    if opts and opts.filetypes then M.config.filetypes = load_files(M.config.filetypes, opts.filetypes) end
    if opts and opts.plugins then M.config.plugins = load_files(M.config.plugins, opts.plugins) end

    M.is_setup = true
end

return setmetatable(M, {
    __index = function(_, key)
        if key == "setup" then return M.setup end
        return rawget(M.config, key)
    end,
})
