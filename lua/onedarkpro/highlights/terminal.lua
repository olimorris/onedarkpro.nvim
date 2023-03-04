local M = {}

---Set the highlights for the terminal colors
---@param theme table
---@return table
function M.groups(theme)
    local color = require("onedarkpro.helpers")

    return {
        terminal_color_0 = theme.palette.black,
        terminal_color_8 = theme.palette.gray,

        terminal_color_1 = theme.palette.red,
        terminal_color_9 = color.brighten(theme.palette.red, 15),

        terminal_color_2 = theme.palette.green,
        terminal_color_10 = color.brighten(theme.palette.green, 15),

        terminal_color_3 = theme.palette.yellow,
        terminal_color_11 = color.brighten(theme.palette.yellow, 15),

        terminal_color_4 = theme.palette.blue,
        terminal_color_12 = color.brighten(theme.palette.blue, 15),

        terminal_color_5 = theme.palette.purple,
        terminal_color_13 = color.brighten(theme.palette.purple, 15),

        terminal_color_6 = theme.palette.cyan,
        terminal_color_14 = color.brighten(theme.palette.cyan, 15),

        terminal_color_7 = theme.palette.fg,
        terminal_color_15 = theme.palette.fg,
    }
end

return M
