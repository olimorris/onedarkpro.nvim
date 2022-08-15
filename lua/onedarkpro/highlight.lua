local utils = require("onedarkpro.utils.collect")

local store = {
    editor = {},
    syntax = {},
    plugins = {},
    custom = {},
    ft = {}
}

local function reset()
    store.editor = {}
    store.syntax = {}
    store.plugins = {}
    store.custom = {}
    store.ft = {}
end

return setmetatable({ reset = reset }, {
    __index = function(_, value)
        if store[value] then
            return store[value]
        end
    end,

    __newindex = function(_, key, value)
        if store[key] then
            store[key] = utils.deep_extend(store[key], value or {})
        end
    end,
})

