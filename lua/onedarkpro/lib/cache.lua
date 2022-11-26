local utils = require("onedarkpro.utils")
local config = require("onedarkpro.config")

local M = {}

---Cache the compiled theme to disk
---@param opts table
---@return nil|boolean
function M.write(opts)
    local cache_path, cache_file = config.get_cached_info(opts)

    utils.ensure_dir(cache_path)
    local file = io.open(cache_file, "wb")

    if file then
        file:write(require("onedarkpro").compiled)
        return file:close()
    end
end

---Clean the given file from disk
---@param opts table
---@return nil
function M.clean(opts)
    local _, cache_file = config.get_cached_info(opts)
    os.remove(cache_file)
end

return M
