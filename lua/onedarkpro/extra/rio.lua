local M = {}

M.template = [[
# Colors - https://github.com/olimorris/onedarkpro.nvim

[colors]
# Regular colors
background               = '${bg}'
black                    = '${black}'
blue                     = '${blue}'
cursor                   = '${purple}'
cyan                     = '${cyan}'
foreground               = '${fg}'
green                    = '${green}'
magenta                  = '${purple}'
red                      = '${red}'
white                    = '${white}'
yellow                   = '${yellow}'

# UI colors
tabs                     = '${fg}'
tabs-active              = '${bright_purple}'
selection-foreground     = '${bright_purple}'
selection-background     = '${gray}'

# Dim colors
dim-black                = '${dim_black}'
dim-blue                 = '${dim_blue}'
dim-cyan                 = '${dim_cyan}'
dim-foreground           = '${dim_fg}'
dim-green                = '${dim_green}'
dim-magenta              = '${dim_purple}'
dim-red                  = '${dim_red}'
dim-white                = '${dim_white}'
dim-yellow               = '${dim_yellow}'

# Light colors
light-black              = '${bright_black}'
light-blue               = '${bright_blue}'
light-cyan               = '${bright_cyan}'
light-foreground         = '${bright_fg}'
light-green              = '${bright_green}'
light-magenta            = '${bright_purple}'
light-red                = '${bright_red}'
light-white              = '${bright_white}'
light-yellow             = '${bright_yellow}'
]]

return M
