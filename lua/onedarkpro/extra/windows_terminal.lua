local M = {}

M.template = [[
{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "schemes":
    [
        {
            "name": "onedarkpro_${name}",
            "background": "${bg}",
            "black": "${black}",
            "blue": "${blue}",
            "brightBlack": "${bright_black}",
            "brightBlue": "${bright_blue}",
            "brightCyan": "${bright_cyan}",
            "brightGreen": "${bright_green}",
            "brightPurple": "${bright_purple}",
            "brightRed": "${bright_red}",
            "brightWhite": "${bright_white}",
            "brightYellow": "${bright_yellow}",
            "cyan": "${cyan}",
            "foreground": "${fg}",
            "green": "${green}",
            "purple": "${purple}",
            "red": "${red}",
            "white": "${white}",
            "yellow": "${yellow}"
        }
    ],
    "themes":
    [
        {
            "name": "onedarkpro_${name}",
            "tab":
            {
                "background": "${cursorline}",
            },
            "tabRow":
            {
                "background": "${selection}",
                "unfocusedBackground": "${black}"
            }
        }
    ]
}
]]

return M
