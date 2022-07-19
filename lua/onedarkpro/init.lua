local M = {}

---Setup the theme via the default config or the users own
---@param user_config table
---@return function
function M.setup(user_config)
    require("onedarkpro.config").set_config(user_config)
end

---Load the theme
---@param name string
---@return table
function M.load()
    local theme = require("onedarkpro.theme").setup_theme()
    return require("onedarkpro.utils").load_theme(theme)
end

---Get the color table for a specific theme (e.g. onedark/onelight).
---@param name string
---@return table
function M.get_colors(name)
    return vim.g.onedarkpro_colors or require("onedarkpro.colors").get_theme_colors(name)
end

return M
