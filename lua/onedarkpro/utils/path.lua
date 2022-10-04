local M = {}

---Get the separator for file paths
---@return string
function M.get_separator()
    --TODO: Add windows support
    return "/"
end

---Check that a given path exists or create it
---@return nil
function M.ensure_dir(path)
    --TODO: Add windows support
    os.execute(string.format("mkdir %s %s", "-p", path))
end

---Using the correct separator, join the paths
---@return string
function M.join_paths(...)
    local separator = M.get_separator()
    return table.concat({ ... }, separator)
end

return M
