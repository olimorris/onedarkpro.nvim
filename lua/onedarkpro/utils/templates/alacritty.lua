local M = require("onedarkpro.utils.colortemplate")

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
    black:      '{brightBlack}'
    red:        '{brightRed}'
    green:      '{brightGreen}'
    yellow:     '{brightYellow}'
    blue:       '{brightBlue}'
    magenta:    '{brightPurple}'
    cyan:       '{brightCyan}'
    white:      '{brightWhite}'

  cursor:
    text: CellBackground
    cursor: CellForeground # syntax-cursor-color

  selection:
    text: CellForeground
    background: "{gray}"
]]

return M
