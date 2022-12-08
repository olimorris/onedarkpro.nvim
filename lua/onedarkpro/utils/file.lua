local M = {}

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
    os.execute(string.format("mkdir %s %s", M.is_windows and "" or "-p", filepath))
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

return M
