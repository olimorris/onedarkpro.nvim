local M = {}

function M.load(config)
    local config = config or require("onedarkpro.config").config
    local utils = require("onedarkpro.utils")

    local colors = require("onedarkpro.colors.onedark").load()

    colors.name = "onedark_vivid"
    colors.red = "#ef596f"
    colors.green = "#89ca78"
    colors.cyan = "#2bbac5"
    colors.purple = "#d55fde"

    -- Allow colors to be overriden by the users config
    utils.color_overrides(colors, config)

    return colors
end

return M
