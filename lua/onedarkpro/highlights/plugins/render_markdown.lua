local C = require("onedarkpro.lib.color")

local M = {}

---Get the highlight group for the plugin
---@param theme table
---@return table
function M.groups(theme)
  local ret = {
    RenderMarkdownBullet = { fg = theme.palette.orange },
    RenderMarkdownCode = { bg = C(theme.palette.bg):darker(3):to_css() },
    RenderMarkdownCodeInline = { bg = C(theme.palette.bg):darker(3):to_css() },
    RenderMarkdownDash = { fg = theme.palette.orange },
    RenderMarkdownTableHead = { fg = theme.palette.red },
    RenderMarkdownTableRow = { fg = theme.palette.orange },
  }

  for i, color in ipairs(theme.rainbow) do
    ret["RenderMarkdownH" .. i] = { fg = color, bold = true }
    ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = C(theme.palette.bg):blend(C(color), 0.1):to_css() }
  end

  return ret
end

return M
