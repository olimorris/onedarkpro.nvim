local util = require("onedarkpro.utils")
local config = require("onedarkpro.config")

local M = {}

---Cache the compiled theme to disk
---@param opts table Should contain the theme and the cache to write
---@return nil|function
function M.write(opts)
    local cache_path, cache_file = config.get_cached_info(opts)

    if opts.prefix then cache_file = opts.prefix .. cache_file end
    if opts.suffix then cache_file = cache_file .. opts.suffix end

    util.ensure_dir(cache_path)
    local f = util.write(cache_file, opts.cache)

    if not f then error("Could not write to cache file for " .. opts.theme) end
end

---Clean the given file from disk
---@param opts table
---@return nil
function M.clean(opts)
    local cache_path, cache_file = config.get_cached_info(opts)

    if opts.file then
        os.remove(util.join_paths(cache_path, opts.file))
        return
    end

    os.remove(cache_file)
end

return M
