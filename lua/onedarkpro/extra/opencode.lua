local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
  return utils.replace_vars(
    [[
{
    "$schema": "https://opencode.ai/theme.json",
    "theme": {
        "primary": "${blue}",
        "secondary": "${purple}",
        "accent": "${cyan}",
        "error": "${red}",
        "warning": "${orange}",
        "success": "${green}",
        "info": "${cyan}",
        "text": "${fg}",
        "textMuted": "${comment}",
        "background": "${bg}",
        "backgroundPanel": "${cursorline}",
        "backgroundElement": "${selection}",
        "border": "${indentline}",
        "borderActive": "${blue}",
        "borderSubtle": "${line_number}",
        "diffAdded": "${green}",
        "diffRemoved": "${red}",
        "diffContext": "${fg}",
        "diffHunkHeader": "${cyan}",
        "diffHighlightAdded": "${bright_green}",
        "diffHighlightRemoved": "${bright_red}",
        "diffAddedBg": "${diff_add}",
        "diffRemovedBg": "${diff_delete}",
        "diffContextBg": "${bg}",
        "diffLineNumber": "${line_number}",
        "diffAddedLineNumberBg": "${diff_add}",
        "diffRemovedLineNumberBg": "${diff_delete}",
        "markdownText": "${fg}",
        "markdownHeading": "${blue}",
        "markdownLink": "${cyan}",
        "markdownLinkText": "${blue}",
        "markdownCode": "${yellow}",
        "markdownBlockQuote": "${comment}",
        "markdownEmph": "${orange}",
        "markdownStrong": "${yellow}",
        "markdownHorizontalRule": "${gray}",
        "markdownListItem": "${fg}",
        "markdownListEnumeration": "${blue}",
        "markdownImage": "${purple}",
        "markdownImageText": "${purple}",
        "markdownCodeBlock": "${green}",
        "syntaxComment": "${comment}",
        "syntaxKeyword": "${purple}",
        "syntaxFunction": "${blue}",
        "syntaxVariable": "${red}",
        "syntaxString": "${green}",
        "syntaxNumber": "${orange}",
        "syntaxType": "${yellow}",
        "syntaxOperator": "${cyan}",
        "syntaxPunctuation": "${fg}"
    }
}
]],
    colors
  )
end

return M
