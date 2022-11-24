local utils = require("onedarkpro.utils")
local config = require("onedarkpro.config")

local M = {}

---
---@param opts [TODO:parameter]
---@param lines [TODO:parameter]
function M.write(opts, lines)
    local cache_path, cache_file = config.get_cached_info(opts)

    utils.ensure_dir(cache_path)
    local file = io.open(cache_file, "wb")

    if file then
        file:write(require("onedarkpro").compiled)
        return file:close()
    end
end

return M
