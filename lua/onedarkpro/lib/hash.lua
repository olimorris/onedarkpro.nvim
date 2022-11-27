---This library allows us to hash the contents of a file. This gives us a ref
---point in deciding if the theme should be re-compiled.
---(Source: https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/lib/hashing.lua)
---(Source: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/hash.lua)
local b = bit or bit32

local M = {}

---Sort a table by key
---@param tbl table
---@param f? function
---@return function
local function sort_table(tbl, f)
    local a = {}
    for n in pairs(tbl) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0 -- iterator variable
    local iter = function() -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], tbl[a[i]]
        end
    end
    return iter
end

---Hash a string
---@param str string
---@return string
local hash_str = function(str) -- MurmurOAAT_32, https://stackoverflow.com/questions/7666509/hash-function-for-string
    local hash = 0x12345678
    local tbl = { string.byte(str, 1, #str) }
    for i = 1, #tbl do
        hash = b.bxor(hash, tbl[i])
        hash = hash * 0x5bd1e995
        hash = b.bxor(hash, b.rshift(hash, 15))
    end
    return hash
end

---Generate a hash from a table
---@param data any
---@return string
function M.generate(data)
    local t = type(data)
    if t == "boolean" then
        return hash_str(data and "1" or "0")
    elseif t == "string" then
        return hash_str(data)
    elseif t == "number" then
        return tostring(data)
    elseif t == "function" then
        return hash_str(string.dump(data))
    else
        local hash = 0
        -- If we don't sort the table by key, then the hash will be different for the same table
        for k, v in sort_table(data) do
            hash = b.bxor(hash, hash_str(k .. ":" .. M.generate(v)))
        end
        return hash
    end
end

return M
