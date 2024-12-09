local M = {}

function M.groups(theme)
    return {
        MiniIconsGrey = { fg = theme.palette.gray },
        MiniIconsPurple = { fg = theme.palette.purple },
        MiniIconsBlue = { fg = theme.palette.blue },
        MiniIconsAzure = { fg = theme.generated.virtual_text_information },
        MiniIconsCyan = { fg = theme.palette.cyan },
        MiniIconsGreen = { fg = theme.palette.green },
        MiniIconsYellow = { fg = theme.palette.yellow },
        MiniIconsOrange = { fg = theme.palette.orange },
        MiniIconsRed = { fg = theme.palette.red },
    }
end

return M
