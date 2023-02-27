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
    for i = 1, #s do
        h = bitop.lshift(h, 5) + h + string.byte(s, i) -- h * 33 + c
    end
    return h
end

-- Reference: https://github.com/catppuccin/nvim/blob/bad9c23f12944683cd11484d9570560849efc101/lua/catppuccin/lib/hashing.lua
---@param x table|function|number|string
---@return string|number
local function hash(x)
    local t = type(x)
    if t == "table" then
        local h = 0
        for k, v in next, x do
            h = bitop.bxor(h, djb2(k .. hash(v)))
        end
        return h
    elseif t == "function" then
        return djb2(string.dump(x))
    end
    return tostring(x)
end

return hash
