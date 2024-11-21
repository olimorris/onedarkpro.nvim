local M = {}

M.template = [[
# Colors - https://github.com/olimorris/onedarkpro.nvim

background ${bg}
foreground ${fg}
cursor none

color0 ${black}
color8 ${gray}

color1 ${red}
color9 ${bright_red}

color2 ${green}
color10 ${bright_green}

color3 ${yellow}
color11 ${bright_yellow}

color4 ${blue}
color12 ${bright_blue}

color5 ${purple}
color13 ${bright_purple}

color6 ${cyan}
color14 ${bright_cyan}

color7 ${white}
color15 ${bright_white}

# Tab bar
active_tab_foreground   ${bright_purple}
active_tab_background   ${bg}
inactive_tab_foreground ${gray}
inactive_tab_background ${bright_black}
]]

return M
