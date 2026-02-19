local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
  local config = require("onedarkpro.config")

  return {
    -- BlinkCmpDoc = { fg = theme.palette.fg, bg = theme.palette.menu },
    BlinkCmpDocBorder = {
      bg = config.options.transparency and "NONE" or theme.generated.float_bg,
      fg = theme.palette.gray,
    },

    BlinkCmpLabel = { fg = theme.palette.fg },
    BlinkCmpLabelDeprecated = { fg = theme.palette.fg },
    BlinkCmpLabelMatch = { fg = theme.palette.blue },

    -- BlinkCmpMenu = { fg = theme.palette.gray },
    BlinkCmpMenuBorder = {
      bg = config.options.transparency and "NONE" or theme.generated.float_bg,
      fg = theme.palette.gray,
    },

    -- BlinkCmpSignatureHelp = { fg = theme.palette.fg, bg = theme.palette.menu },
    BlinkCmpSignatureHelpBorder = {
      bg = config.options.transparency and "NONE" or theme.generated.float_bg,
      fg = theme.palette.gray,
    },

    BlinkCmpSource = { fg = theme.palette.comment },

    BlinkCmpKindText = { fg = theme.palette.orange },
    BlinkCmpKindMethod = { fg = theme.palette.blue },
    BlinkCmpKindFunction = { fg = theme.palette.blue },
    BlinkCmpKindConstructor = { fg = theme.palette.yellow },
    BlinkCmpKindField = { fg = theme.palette.blue },
    BlinkCmpKindClass = { fg = theme.palette.yellow },
    BlinkCmpKindInterface = { fg = theme.palette.yellow },
    BlinkCmpKindModule = { fg = theme.palette.blue },
    BlinkCmpKindProperty = { fg = theme.palette.blue },
    BlinkCmpKindValue = { fg = theme.palette.orange },
    BlinkCmpKindEnum = { fg = theme.palette.yellow },
    BlinkCmpKindKeyword = { fg = theme.palette.purple },
    BlinkCmpKindSnippet = { fg = theme.palette.green },
    BlinkCmpKindFile = { fg = theme.palette.blue },
    BlinkCmpKindEnumMember = { fg = theme.palette.cyan },
    BlinkCmpKindConstant = { fg = theme.palette.green },
    BlinkCmpKindStruct = { fg = theme.palette.yellow },
    BlinkCmpKindTypeParameter = { fg = theme.palette.yellow },
    BlinkCmpKindUnit = { fg = theme.palette.yellow },
    BlinkCmpKindEvent = { fg = theme.palette.blue },
    BlinkCmpKindOperator = { fg = theme.palette.cyan },
  }
end

return M
