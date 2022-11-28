---This library allows us to hash the contents of a file. This gives us a ref
---point in deciding if the theme should be re-compiled.
---(Source: https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/lib/hashing.lua)
---(Source: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/hash.lua)
local b = bit or bit32

local M = {}

function M.sort_table(tbl, f)
    local a = {}
    for n in pairs(tbl) do
        if type(n) == "table" then
            M.sort_table(n, f)
        else
            table.insert(a, n)
        end
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
---@param str any
---@return string
local hash_str = function(str)
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
---@param tbl table
---@return string
function M.hash(tbl)
    local t = type(tbl)
    if t == "boolean" then
        return hash_str(tbl and "1" or "0")
    elseif t == "string" then
        return hash_str(tbl)
    elseif t == "number" then
        return tostring(tbl)
    elseif t == "function" then
        return hash_str(string.dump(tbl))
    else
        local hash = 0
        for k, v in pairs(tbl) do
            hash = b.bxor(hash, hash_str(k .. ":" .. M.hash(v)))
        end
        return hash
    end
end

return M
