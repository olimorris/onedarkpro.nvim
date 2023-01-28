local M = require("onedarkpro.utils.colortemplate")

M.template = [[
{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "schemes":
    [
        {
            "name": "OneDarkPro.nvim",
            "background": "{bg}",
            "black": "{black}",
            "blue": "{blue}",
            "brightBlack": "{gray}",
            "brightBlue": "{blue}",
            "brightCyan": "{cyan}",
            "brightGreen": "{green}",
            "brightPurple": "{purple}",
            "brightRed": "{red}",
            "brightWhite": "{white}",
            "brightYellow": "{yellow}",
            "cyan": "{cyan}",
            "foreground": "{fg}",
            "green": "{green}",
            "purple": "{purple}",
            "red": "{red}",
            "white": "{white}",
            "yellow": "{yellow}"
        }
    ],
    "themes":
    [
        {
            "name": "OneDarkPro.nvim",
            "tab":
            {
                "background": "{cursorline}",
            },
            "tabRow":
            {
                "background": "{selection}",
                "unfocusedBackground": "{black}"
            }
        }
    ]
}
]]

return M
