local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
    return utils.replace_vars(
        [[
# Colors - https://github.com/olimorris/onedarkpro.nvim
[colors.primary]
background  = "${bg}"
foreground  = "${fg}"

[colors.normal]
black       = "${black}"
red         = "${red}"
green       = "${green}"
yellow      = "${yellow}"
blue        = "${blue}"
magenta     = "${purple}"
cyan        = "${cyan}"
white       = "${white}"

[colors.bright]
black       = "${bright_black}"
red         = "${bright_red}"
green       = "${bright_green}"
yellow      = "${bright_yellow}"
blue        = "${bright_blue}"
magenta     = "${bright_purple}"
cyan        = "${bright_cyan}"
white       = "${bright_white}"

[colors.cursor]
text        = "CellBackground"
cursor      = "CellForeground" # syntax-cursor-color

[colors.selection]
text        = "CellForeground"
background  = "${gray}"
]],
        colors
    )
end

return M
