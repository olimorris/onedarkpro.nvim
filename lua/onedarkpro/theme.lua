M = {}

M.themes = {
    "onedark",
    "onelight",
    "onedark_dark",
    "onedark_vivid",
}

---Get the name of the theme to load
---@param theme function|string
---@return string
local function get_theme(theme)
    if type(theme) == "function" then
        theme = theme()
    end

    local logger = require("onedarkpro.utils.logging")
    if logger:has_level() then
        logger.debug("Getting theme: " .. theme)
    end

    if vim.tbl_contains(M.themes, theme) then
        return theme
    end

    return "onedark"
end

---Load a theme and apply user overrides
---@param theme? string (optional)
---@return table
function M.load(theme)
    theme = get_theme(theme or require("onedarkpro.config").config.theme)
    theme = require("onedarkpro.themes." .. theme)

    if require("onedarkpro.override").has_override then
        theme.palette = require("onedarkpro.lib.palette").override(theme.palette, theme.meta.name)
    end

    if type(theme.generated) == "function" then
        theme.generated = theme.generated(theme.palette)
    end

    return theme
end

return M
