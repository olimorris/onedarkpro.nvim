local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
  return utils.replace_vars(
    [[
gui:
  nerdFontsVersion: "3"
  theme:
    241:
      - "${purple}"
    activeBorderColor:
      - "${green}"
      - "bold"
    inactiveBorderColor:
      - "${gray}"
    searchingActiveBorderColor:
      - "${green}"
      - "bold"
    optionsTextColor:
      - "${blue}"
    selectedLineBgColor:
      - "${selection}"
    cherryPickedCommitFgColor:
      - "${blue}"
    cherryPickedCommitBgColor:
      - "${purple}"
    markedBaseCommitFgColor:
      - "${blue}"
    markedBaseCommitBgColor:
      - "${yellow}"
    unstagedChangesColor:
      - "${red}"
    defaultFgColor:
      - "${fg}"
]],
    colors
  )
end

return M
