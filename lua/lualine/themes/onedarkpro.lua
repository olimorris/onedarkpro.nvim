local colors = require("onedarkpro").get_colors()

local onedarkpro = {}

onedarkpro.normal = {
    a = { bg = colors.green, fg = colors.bg },
    b = { bg = colors.lualine_bg_lighter, fg = colors.green },
    c = { bg = colors.lualine_bg, fg = colors.fg },
}

onedarkpro.insert = {
    a = { bg = colors.blue, fg = colors.bg },
    b = { bg = colors.lualine_bg_lighter, fg = colors.blue },
}

onedarkpro.command = {
    a = { bg = colors.purple, fg = colors.bg },
    b = { bg = colors.lualine_bg_lighter, fg = colors.purple },
}

onedarkpro.visual = {
    a = { bg = colors.yellow, fg = colors.bg },
    b = { bg = colors.lualine_bg_lighter, fg = colors.yellow },
}

onedarkpro.replace = {
    a = { bg = colors.red, fg = colors.bg },
    b = { bg = colors.lualine_bg_lighter, fg = colors.red },
}

onedarkpro.inactive = {
    a = { bg = colors.lualine_bg, fg = colors.blue },
    b = { bg = colors.lualine_bg, fg = colors.lualine_bg_lighter, gui = "bold" },
    c = { bg = colors.lualine_bg, fg = colors.lualine_bg_lighter },
}

return onedarkpro
