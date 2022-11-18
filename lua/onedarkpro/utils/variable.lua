local M = {}

---Replace ${variables} in a table
---Example replace_vars: "${name} is ${value}"
---@param str string replace_vars string
---@param tbl table key value pairs to replace in the string
---@return string
local function replace_var(str, tbl)
    return (str:gsub("($%b{})", function(w)
        return tbl[w:sub(3, -2)] or w
    end))
end

---Replace variables in a table recursively
---@param tbl table the table to be replaced
---@param values table the values to be replaced by the replace_vars strings in the table passed in
---@return string|number|table
function M.replace_vars(tbl, values)
    -- if the value passed is a string the return templated resolved string
    if type(tbl) == "string" then
        return replace_var(tbl, values)
    end

    if type(tbl) == "number" then
        return tbl
    end

    -- If the table passed in has a table then iterate though the children and call replace_vars table
    for key, value in pairs(tbl) do
        tbl[key] = M.replace_vars(value, values)
    end

    return tbl
end

return M
