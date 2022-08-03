local M = {}

---Merges recursively two or more map-like tables
---@param...any Two or more map-like tables
---@return table Merged table
function M.deep_extend(...)
    local lhs = {}
    for _, rhs in ipairs({ ... }) do
        for k, v in pairs(rhs) do
            if type(lhs[k]) == "table" and type(v) == "table" then
                lhs[k] = M.deep_extend(lhs[k], v)
            else
                lhs[k] = v
            end
        end
    end
    return lhs
end

---Pretty print a table
---@param tbl table
---@return string
function M.print_table(tbl)
    require("pl.pretty").dump(tbl)
end

return M
