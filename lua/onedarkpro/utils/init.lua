local M = {}

M.has_nvim_07 = vim.fn.has("nvim-0.7") == 1
M.has_nvim_08 = vim.fn.has("nvim-0.8") == 1

if jit ~= nil then
    M.is_windows = jit.os == "Windows"
else
    M.is_windows = package.config:sub(1, 1) == "\\"
end

---Get the separator for file paths
---@return string
function M.get_separator()
    if M.is_windows then
        return "\\"
    end
    return "/"
end

---Check that a given path exists and create it if not
---@param path string
function M.ensure_dir(path)
    os.execute(string.format("mkdir %s %s", M.is_windows and "" or "-p", path))
end

---Determine if a given path exists
---@param path string
---@return boolean
function M.exists(path)
    local f = io.open(path, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

---Join multiple paths together
---@return string
function M.join_paths(...)
    local separator = M.get_separator()
    return table.concat({ ... }, separator)
end

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

---Replaces values from one table with values from another
---@param...any Two or more map-like tables
---@return table Merged table
function M.deep_replace(lhs, rhs)
    for k, v in pairs(rhs) do
        lhs[k] = v
    end
    return lhs
end

---Return true if any pattern in the tbl matches the provided value
---@param tbl table
---@param val string
---@return boolean
function M.pattern_match(tbl, val)
    return tbl and next(vim.tbl_filter(function(pattern)
        return val:match(pattern)
    end, tbl))
end

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
    if type(tbl) == "string" then
        return replace_var(tbl, values)
    end

    if type(tbl) == "number" then
        return tbl
    end

    for key, value in pairs(tbl) do
        tbl[key] = M.replace_vars(value, values)
    end

    return tbl
end

return M
