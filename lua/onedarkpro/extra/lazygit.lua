local M = {}

M.template = [[
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
]]

return M
