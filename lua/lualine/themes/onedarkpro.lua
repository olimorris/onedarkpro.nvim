local colors = require("onedarkpro").get_colors()

local onedarkpro = {}

onedarkpro.normal = {
    a = { bg = colors.green, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.green },
    c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

onedarkpro.insert = {
    a = { bg = colors.blue, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.blue },
}

onedarkpro.command = {
    a = { bg = colors.purple, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.purple },
}

onedarkpro.visual = {
    a = { bg = colors.yellow, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.yellow },
}

onedarkpro.replace = {
    a = { bg = colors.red, fg = colors.bg },
    b = { bg = colors.fg_gutter, fg = colors.red },
}

onedarkpro.inactive = {
    a = { bg = colors.bg_statusline, fg = colors.blue },
    b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
    c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

return onedarkpro
