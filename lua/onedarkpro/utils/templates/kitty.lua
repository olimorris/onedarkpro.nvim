local M = require("onedarkpro.utils.colortemplate")

M.template = [[
# Colors - https://github.com/olimorris/onedarkpro.nvim

background {bg}
foreground {fg}
cursor none

color0 {black}
color8 {gray}

color1 {red}
color9 {brightRed}

color2 {green}
color10 {brightGreen}

color3 {yellow}
color11 {brightYellow}

color4 {blue}
color12 {brightBlue}

color5 {purple}
color13 {brightPurple}

color6 {cyan}
color14 {brightCyan}

color7 {white}
color15 {brightWhite}

# Tab bar
active_tab_foreground   {brightPurple}
active_tab_background   {bg}
inactive_tab_foreground {gray}
inactive_tab_background {brightBlack}
]]

return M
