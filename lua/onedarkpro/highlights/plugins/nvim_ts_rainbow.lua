local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local ret = {}

    for i, color in ipairs(theme.rainbow) do
        ret["rainbowcol" .. i] = { fg = color }
    end

    return ret
end

return M
