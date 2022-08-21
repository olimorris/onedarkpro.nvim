local utils = require("onedarkpro.utils.collect")
local M = {}

-- Default options for the theme
local defaults = {
    -- This enables the Neovim background to set either onedark or onelight
    dark_theme = "onedark", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    theme = function()
        if vim.o.background == "dark" then
            return M.config.dark_theme
        else
            return M.config.light_theme
        end
    end,
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
    plugins = { -- Enable/Disable specific plugins
        aerial = true,
        barbar = true,
        copilot = true,
        dashboard = true,
        gitsigns_nvim = true,
        hop = true,
        indentline = true,
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
        packer = true,
        polygot = true,
        startify = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble_nvim = true,
        vim_ultest = true,
        which_key_nvim = true,
    },
    styles = {
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        functions = "NONE", -- Style that is applied to functions
        variables = "NONE", -- Style that is applied to variables
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
        bold = false, -- Use the themes opinionated bold styles?
        italic = false, -- Use the themes opinionated italic styles?
        underline = false, -- Use the themes opinionated underline styles?
        undercurl = false, -- Use the themes opinionated undercurl styles?
        cursorline = false, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    },
}

---Set the theme's options
---@return table
local function set_options(opts)
    if opts.cursorline then
        vim.wo.cursorline = true
    end

    M.config.options = {
        bold = opts.bold and "bold" or "NONE",
        italic = opts.italic and "italic" or "NONE",
        undercurl = opts.undercurl and "undercurl" or "NONE",
        underline = opts.underline and "underline" or "NONE",
        undercurl_underline = (opts.undercurl and "undercurl" or (opts.underline and "underline" or "NONE")),
        bold_italic = (opts.bold ~= "NONE" and opts.italic ~= "NONE") and "bold,italic" or "NONE",
        cursorline = opts.cursorline or opts.highlight_cursorline,
        transparency = opts.transparency or opts.transparent,
        terminal_colors = opts.terminal_colors,
        window_unfocused_color = opts.window_unfocused_color or opts.window_unfocussed_color,
    }

    return M.config.options
end

---Set the plugins to load with the theme
---@return nil
local function set_plugins(plugin_list, opts)
    for plugin, _ in pairs(plugin_list) do
        if opts["all"] == false then
            M.config.plugins[plugin] = false
        end
        if opts[plugin] then
            M.config.plugins[plugin] = opts[plugin]
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

    set_options(M.config.options)

    if opts.plugins then
        set_plugins(M.config.plugins, opts.plugins)
    end
end

return M
