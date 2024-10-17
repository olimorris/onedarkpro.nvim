local M = {}

M.template = [[
[colors]
ansi = [
  '${black}',
  '${red}',
  '${green}',
  '${yellow}',
  '${blue}',
  '${purple}',
  '${cyan}',
  '${white}',
]
background = '${bg}'
brights = [
  '${gray}',
  '${bright_red}',
  '${bright_green}',
  '${bright_yellow}',
  '${bright_blue}',
  '${bright_purple}',
  '${bright_cyan}',
  '${bright_white}',
]
cursor_bg = '${purple}'
cursor_fg = '${bg}'
foreground = '${fg}'
selection_bg = '${purple}'
selection_fg = '${fg}'

[colors.indexed]

[metadata]
name = 'onedarkpro_${name}'
origin_url = 'https://github.com/olimorris/onedarkpro.nvim'
]]

return M
