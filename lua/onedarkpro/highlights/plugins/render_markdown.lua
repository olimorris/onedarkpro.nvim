local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local color = require("onedarkpro.helpers")
    return {
        -- RenderMarkdownCode = { bg = C.surface0 },
		    -- RenderMarkdownCodeInline = { bg = C.surface1 },
		    -- RenderMarkdownBullet = { fg = C.sky },
		    -- RenderMarkdownTableHead = { fg = C.blue },
		    -- RenderMarkdownTableRow = { fg = C.lavender },
        -- Headings
        RenderMarkdownH1 = { fg = theme.palette.red },
        RenderMarkdownH1Bg = { bg = color.darken('red', 10) },
        RenderMarkdownH2 = { fg = theme.palette.orange },
        RenderMarkdownH2Bg = { bg = color.darken('orange', 10) },
        RenderMarkdownH3 = { fg = theme.palette.yellow },
        RenderMarkdownH3Bg = { bg = color.darken('yellow', 10) },
        RenderMarkdownH4 = { fg = theme.palette.green },
        RenderMarkdownH4Bg = { bg = color.darken('green', 10) },
        RenderMarkdownH5 = { fg = theme.palette.cyan },
        RenderMarkdownH5Bg = { bg = color.darken('cyan', 10) },
        RenderMarkdownH6 = { fg = theme.palette.purple },
        RenderMarkdownH6Bg = { bg = color.darken('purple', 10) },

    }
end

return M
