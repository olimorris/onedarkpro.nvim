---This library allows us to hash the contents of a file. This gives us a ref
---point in deciding if the theme should be re-compiled.
---(Source: https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/lib/hashing.lua)
---(Source: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/hash.lua)
local bitop = bit or bit32 or require("onedarkpro.lib.native_bit")

-- https://theartincode.stanis.me/008-djb2/
---@param s string
---@return number
local function djb2(s)
    local h = 5381
    local t = { string.byte(s, 1, #s) }
    for i = 1, #t do
        h = bitop.lshift(h, 5) + t[i] -- h * 33 + c
    end
    return h
end

-- Reference: https://github.com/catppuccin/nvim/blob/151b5f6aa74f08a707a7862519bdc38bb2b9f505/lua/catppuccin/lib/hashing.lua
---@param x table|function|number|string
---@return string|number
local function hash(x)
    local t = type(x)
    if t == "table" then
        local h = 0
        for k, v in pairs(x) do
            h = bitop.bxor(h, djb2(k .. hash(v)))
        end
        return h
    elseif t == "function" then
        return djb2(string.dump(x))
    end
    return tostring(x)
end

return hash
