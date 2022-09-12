local M = {}

---Replace ${variables} in a table
---Example replace_vars: "${name} is ${value}"
---@param str string replace_vars string
---@param table table key value pairs to replace in the string
---@return table
local function replace_var(str, table)
    return (str:gsub("($%b{})", function(w)
        return table[w:sub(3, -2)] or w
    end))
end


---Replace variables in a table recursively
---@param table table the table to be replaced
---@param values table the values to be replaced by the replace_vars strings in the table passed in
---@return table
function M.replace_vars(table, values)
    -- if the value passed is a string the return templated resolved string
    if type(table) == "string" then
        return replace_var(table, values)
    end

    if type(table) == "number" then
        return table
    end

    -- If the table passed in has a table then iterate though the children and call replace_vars table
    for key, value in pairs(table) do
        table[key] = M.replace_vars(value, values)
    end

    return table
end

return M
