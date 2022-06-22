local M = {}

-- Default options for the theme
M.config = {
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
    hlgroups = {}, -- Override default highlight groups
    filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
    filetype_hlgroups_ignore = { -- Filetypes which are ignored when applying filetype highlight groups
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
        notify = true,
        nvim_cmp = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = true,
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
        window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    },
}

---Apply the users custom config on top of the default
---@param user_config table
---@return nil
function M.set_config(user_config)
    local utils = require("onedarkpro.utils")

    -- Merge the config tables
    user_config = user_config or {}
    M.config = utils.tbl_deep_extend(M.config, user_config)

    -- Overwrite the default plugins config with the user's
    if user_config.plugins then
        for plugin, _ in pairs(M.config.plugins) do
            if user_config.plugins["all"] == false then
                M.config.plugins[plugin] = false
            end
            if user_config.plugins[plugin] then
                M.config.plugins[plugin] = user_config.plugins[plugin]
            end
        end
    end

    -- Enable the cursorline in Neovim
    if M.config.options.highlight_cursorline or M.config.options.cursorline then
        vim.wo.cursorline = true
    end
end

return M
