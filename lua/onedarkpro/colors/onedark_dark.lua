local M = {}
local colors = {}
local utils = require("onedarkpro.utils")

function M.load(config)
    local config = config or require("onedarkpro.config").config
    local onedark = require("onedarkpro.colors.onedark")

    colors = onedark.base_colors()
    colors.name = "onedark_dark"
    colors.style = "dark"
    colors.bg = "#000000"
    colors.black = "#000000"
    colors.gray = "#434852"

    utils.color_overrides(colors, config)

    colors = onedark.additional_colors()

    return colors
end

return M
