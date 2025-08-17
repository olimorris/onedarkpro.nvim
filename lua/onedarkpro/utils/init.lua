local M = {}

---Fire an event
---@param event string
---@param opts? table
function M.fire(event, opts)
    opts = opts or {}
    vim.api.nvim_exec_autocmds("User", { pattern = "OneDarkPro" .. event, data = opts })
end

--#region Table Helpers --------------------------------------------------------

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

---Create a copy of a deeply nested table
---@param obj table
---@param seen? table
---@return table
function M.deep_copy(obj, seen)
    if type(obj) ~= "table" then return obj end
    if seen and seen[obj] then return seen[obj] end

    local s = seen or {}
    local res = {}
    s[obj] = res

    for k, v in pairs(obj) do
        res[M.deep_copy(k, s)] = M.deep_copy(v, s)
    end

    return setmetatable(res, getmetatable(obj))
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
function M.replace_var(str, tbl)
    return (str:gsub("($%b{})", function(w)
        return tbl[w:sub(3, -2)] or w
    end))
end

---Replace variables in a table recursively
---@param vars string|number|boolean|table the table to be replaced
---@param values table the values to be replaced by the replace_vars strings in the table passed in
---@return string|number|table|boolean
function M.replace_vars(vars, values)
    if type(vars) == "string" then return M.replace_var(vars, values) end

    if type(vars) == "number" or type(vars) == "boolean" then return vars end

    for key, value in pairs(vars) do
        vars[key] = M.replace_vars(value, values)
    end

    return vars
end

--#endregion

--#region File Helpers ---------------------------------------------------------
if jit ~= nil then
    M.is_windows = jit.os == "Windows"
else
    M.is_windows = package.config:sub(1, 1) == "\\"
end

---Get the separator for file paths
---@return string
local function get_separator()
    if M.is_windows then return "\\" end
    return "/"
end

---Check that a given path exists and create it if not
---@param filepath string
function M.ensure_dir(filepath)
    if vim.fn.isdirectory(filepath) == 0 then vim.fn.mkdir(filepath, "p") end
end

---Determine if a given path exists
---@param filepath string
---@return boolean
function M.exists(filepath)
    local f = io.open(filepath, "r")
    if f ~= nil then
        io.close(f)
        return true
    end
    return false
end

---Join multiple paths together
---@return string
function M.join_paths(...)
    local separator = get_separator()
    return table.concat({ ... }, separator)
end

---Write data to a filepath
---@param filepath string
---@param data string
---@return boolean
function M.write(filepath, data)
    vim.fn.mkdir(vim.fn.fnamemodify(filepath, ":h"), "p")
    local file = io.open(filepath, "wb")
    if file then
        file:write(data)
        file:close()
        return true
    end

    return false
end

---Read data from a file
---@param filepath string
---@return string|nil
function M.read(filepath)
    local file = io.open(filepath, "r")
    if file then
        local data = file:read()
        file:close()
        return data
    end
    return nil
end

---Create a hash for a file
---On nix, timestamps are reset to 0 therefore taking in filesize creates a more
---useful hash to reference when deciding if a file should be recompiled
---(source: https://github.com/lewis6991/impatient.nvim/blob/main/lua/impatient.lua#L90)
---@param filepath string
---@return string|function
function M.hash(filepath)
    local stat = vim.loop.fs_stat(filepath)
    if stat then return tostring(stat.mtime.sec .. stat.mtime.nsec .. stat.size) end
    error("Could not hash " .. filepath)
end

--#endregion

return M
