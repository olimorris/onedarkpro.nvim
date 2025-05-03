local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    local ret = {
        CsvViewHeaderLine = { fg = theme.palette.blue, style = "bold" },
    }

    for i, color in ipairs(theme.rainbow) do
        ret["CsvViewCol" .. (i - 1)] = { fg = color }
    end

    return ret
end

return M
