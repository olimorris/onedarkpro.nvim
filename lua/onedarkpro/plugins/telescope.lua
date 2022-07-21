local M = {}
local utils = require("onedarkpro.utils")

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    local telescope_prompt = theme.config.options.transparency and "NONE" or utils.darken(theme.colors.bg, 0.98)
    local telescope_results = theme.config.options.transparency and "NONE" or utils.darken(theme.colors.bg, 0.95)

    if theme.colors.style == "dark" then
        telescope_prompt = theme.config.options.transparency and "NONE" or utils.lighten(theme.colors.bg, 0.97)
        telescope_results = theme.config.options.transparency and "NONE" or utils.darken(theme.colors.bg, 0.85)
    end

    return {
        TelescopeSelection = {
            bg = telescope_prompt,
        },
        -- TelescopeSelectionCaret = { fg = theme.colors.purple },
        -- TelescopeMultiSelection = {
        --     bg = theme.options.cursorline,
        --     fg = theme.colors.comment,
        -- },
        TelescopeNormal = { bg = telescope_results },
        TelescopeBorder = { fg = telescope_results, bg = telescope_results },
        -- TelescopePreviewBorder = { link = "TelescopeBorder" },
        TelescopeMatching = {
            fg = theme.colors.purple,
        },

        TelescopePreviewTitle = { fg = theme.colors.bg, bg = theme.colors.green },
        TelescopeResultsTitle = { fg = theme.colors.bg, bg = theme.colors.purple },

        TelescopePromptBorder = { fg = telescope_prompt, bg = telescope_prompt },
        TelescopePromptCounter = { fg = theme.colors.fg },
        TelescopePromptNormal = { fg = theme.colors.fg, bg = telescope_prompt },
        TelescopePromptPrefix = { fg = theme.colors.purple, bg = telescope_prompt },
        TelescopePromptTitle = { fg = theme.colors.bg, bg = theme.colors.purple },

        -- TelescopePrompt = { link = "TelescopeNormal" },
    }
end

return M
