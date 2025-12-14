local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
  return utils.replace_vars(
    [[
// Colors - https://github.com/olimorris/onedarkpro.nvim

themes {
    onedarkpro {
        fg "${fg}"
        bg "${bg}"
        black "${black}"
        red "${red}"
        green "${green}"
        yellow "${yellow}"
        blue "${blue}"
        magenta "${purple}"
        cyan "${cyan}"
        white "${white}"
        orange "${orange}"
    }
}
]],
    colors
  )
end

return M
