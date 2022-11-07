local M = {
    checked = false,
}

---Check for deprecations in the user's config
---@param opts table  User's config
---@return nil
function M.check(opts)
    if M.checked then
        return
    end

    -- local dep = require("onedarkpro.utils.deprecate")
    -- local utils = require("onedarkpro.utils")

    M.checked = true
end

return M
