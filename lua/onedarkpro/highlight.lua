local utils = require("onedarkpro.utils.collect")

local store = {
    editor = {},
    syntax = {},
    plugins = {},
    user_defined = {},
}

local function reset()
    store.editor = {}
    store.syntax = {}
    store.plugins = {}
    store.user_defined = {}
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
        end
    end,
})

