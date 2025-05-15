local utils = require("onedarkpro.utils")

local M = {}

function M.generate(colors)
    return utils.replace_vars(
        [[
# Colors - https://github.com/olimorris/onedarkpro.nvim

palette = 0=${black}
palette = 1=${red}
palette = 2=${green}
palette = 3=${yellow}
palette = 4=${blue}
palette = 5=${purple}
palette = 6=${cyan}
palette = 7=${white}
palette = 8=${gray}
palette = 9=${bright_red}
palette = 10=${bright_green}
palette = 11=${bright_yellow}
palette = 12=${bright_blue}
palette = 13=${bright_purple}
palette = 14=${bright_cyan}
palette = 15=${bright_white}
background = ${bg}
foreground = ${fg}
cursor-color = ${purple}
selection-background = ${purple}
selection-foreground = ${fg}
]],
        colors
    )
end

return M
