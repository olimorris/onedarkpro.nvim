local M = require("onedarkpro.utils.template")

M.template = [[
# Colors - https://github.com/olimorris/onedarkpro.nvim
colors:
  primary:
    background: '{bg}'
    foreground: '{fg}'

  normal:
    black:      '{black}'
    red:        '{red}'
    green:      '{green}'
    yellow:     '{yellow}'
    blue:       '{blue}'
    magenta:    '{purple}'
    cyan:       '{cyan}'
    white:      '{white}'

  bright:
    black:      '{bright_black}'
    red:        '{bright_red}'
    green:      '{bright_green}'
    yellow:     '{bright_yellow}'
    blue:       '{bright_blue}'
    magenta:    '{bright_purple}'
    cyan:       '{bright_cyan}'
    white:      '{bright_white}'

  cursor:
    text: CellBackground
    cursor: CellForeground # syntax-cursor-color

  selection:
    text: CellForeground
    background: "{gray}"
]]

return M
