local M = require("onedarkpro.utils.template")

M.template = [[
[colors]
ansi = [
  '{black}',
  '{red}',
  '{green}',
  '{yellow}',
  '{blue}',
  '{purple}',
  '{cyan}',
  '{white}',
]
brights = [
  '{gray}',
  '{bright_red}',
  '{bright_green}',
  '{bright_yellow}',
  '{bright_blue}',
  '{bright_purple}',
  '{bright_cyan}',
  '{bright_white}',
]

background = '{bg}'
foreground = '{fg}'
selection_bg = '{purple}'
selection_fg = '{white}'

[colors.indexed]

[metadata]
name = 'OneDarkPro'
origin_url = 'https://github.com/olimorris/onedarkpro.nvim'
]]

return M
