local helpers = require("onedarkpro.helpers")
local utils = require("onedarkpro.utils")

local M = {}

M.extras = {
    alacritty = { ft = "toml", url = "https://github.com/alacritty/alacritty", label = "Alacritty" },
    foot = { ft = "dosini", url = "https://codeberg.org/dnkl/foot", label = "Foot" },
    kitty = { ft = "conf", url = "https://github.com/kovidgoyal/kitty", label = "Kitty" },
    lazygit = { ft = "yml", url = "https://github.com/jesseduffield/lazygit", label = "Lazygit" },
    rio = { ft = "toml", url = "https://github.com/raphamorim/rio", label = "Rio" },
    wezterm = { ft = "toml", url = "https://github.com/wez/wezterm", label = "Wezterm" },
    windows_terminal = {
        ft = "json",
        url = "https://learn.microsoft.com/en-us/windows/terminal/",
        label = "Windows Terminal",
    },
    zellij = { ft = "kdl", url = "https://github.com/zellij-org/zellij", label = "Zellij" },
}

local function replace(str, tbl)
    return str:gsub("${(.-)}", tbl)
end

local function add_bright_colors(colors, theme)
    colors["bright_black"] = helpers.lighten("black", 10, theme)
    colors["bright_blue"] = helpers.lighten("blue", 10, theme)
    colors["bright_cyan"] = helpers.lighten("cyan", 10, theme)
    colors["bright_gray"] = helpers.lighten("gray", 10, theme)
    colors["bright_green"] = helpers.lighten("green", 10, theme)
    colors["bright_orange"] = helpers.lighten("orange", 10, theme)
    colors["bright_purple"] = helpers.lighten("purple", 10, theme)
    colors["bright_red"] = helpers.lighten("red", 10, theme)
    colors["bright_white"] = helpers.lighten("white", 10, theme)
    colors["bright_yellow"] = helpers.lighten("yellow", 10, theme)
    colors["bright_fg"] = helpers.lighten("yellow", 10, theme)
end

local function add_dim_colors(colors, theme)
    colors["dim_black"] = helpers.darken("black", 10, theme)
    colors["dim_blue"] = helpers.darken("blue", 10, theme)
    colors["dim_cyan"] = helpers.darken("cyan", 10, theme)
    colors["dim_gray"] = helpers.darken("gray", 10, theme)
    colors["dim_green"] = helpers.darken("green", 10, theme)
    colors["dim_orange"] = helpers.darken("orange", 10, theme)
    colors["dim_purple"] = helpers.darken("purple", 10, theme)
    colors["dim_red"] = helpers.darken("red", 10, theme)
    colors["dim_white"] = helpers.darken("white", 10, theme)
    colors["dim_yellow"] = helpers.darken("yellow", 10, theme)
    colors["dim_fg"] = helpers.darken("fg", 10, theme)
end

---Generate extras
---@param opts? table
function M.setup(opts)
    local config = require("onedarkpro.config")
    local themes = config.themes

    local extras = vim.tbl_keys(M.extras)
    table.sort(extras)

    local path = "extras/"
    if opts and opts.user_config then path = config.cache_path .. "/extras/" end

    print("Generating extras:")
    for _, extra in ipairs(extras) do
        local extra_template = require("onedarkpro.extra." .. extra).template
        for theme, _ in pairs(themes) do
            print("  " .. M.extras[extra].label .. " " .. theme)
            config.set_theme(theme)
            local colors = require("onedarkpro.helpers").get_colors(theme)
            add_bright_colors(colors, theme)
            add_dim_colors(colors, theme)
            utils.write(
                path .. extra .. "/onedarkpro_" .. theme .. "." .. M.extras[extra].ft,
                replace(extra_template, colors)
            )
        end
    end
end

return M
