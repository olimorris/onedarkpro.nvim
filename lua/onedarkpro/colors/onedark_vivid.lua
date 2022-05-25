local M = {}
local colors = {}
local utils = require("onedarkpro.utils")

function M.load(config)
    local config = config or require("onedarkpro.config").config
    local onedark = require("onedarkpro.colors.onedark")

    colors = onedark.base_colors()
    colors.name = "onedark_vivid"
    colors.style = "dark"
    colors.red = "#ef596f"
    colors.green = "#89ca78"
    colors.cyan = "#2bbac5"
    colors.purple = "#d55fde"

    utils.color_overrides(colors, config)

    colors = onedark.additional_colors()

    return colors
end

return M
