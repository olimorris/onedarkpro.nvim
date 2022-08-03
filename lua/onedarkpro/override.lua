--[[
--Credit to: https://github.com/EdenEast/nightfox.nvim
--For this beautifully way of overriding the theme's config
--I've further simplified it to *try* and make it more concise
--]]

local utils = require("onedarkpro.utils.collect")

local store = {
    colors = {},
    groups = {},
    has_override = false,
}

local function reset()
    store.colors = {}
    store.groups = {}
    store.has_override = false
end

return setmetatable({ reset = reset }, {
    __index = function(_, value)
        if store[value] then
            return store[value]
        end
    end,

    __newindex = function(_, key, value)
        if store[key] then
            store[key] = utils.merge_tables(store[key], value or {})
            store.has_override = true
        end
    end,
})
