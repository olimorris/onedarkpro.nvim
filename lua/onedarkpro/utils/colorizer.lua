local M = {}

---Determine the maximum length of a string in a table
---@param tbl table
---@return integer
local function get_max_length(tbl)
    local max_length = 0

    for key, _ in pairs(tbl) do
        if #key > max_length then max_length = #key end
    end

    return max_length
end

---Show the theme's colors in a scratch buffer
---@return nil
function M.show()
    local colors = require("onedarkpro").get_colors()
    local buf = vim.api.nvim_create_buf(true, true)
    local max_length = get_max_length(colors)

    local line = 0
    for color, hex in pairs(colors) do
        if color ~= "none" and color ~= "name" and color ~= "background" then
            vim.api.nvim_buf_set_lines(buf, line, (line + 1), false, {
                color .. string.rep(" ", max_length - #color) .. ' = "' .. tostring(hex) .. '"',
            })
            line = line + 1
        end
    end

    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "filetype", "Onedarkpro")
    vim.api.nvim_buf_set_name(buf, "OneDarkPro Colors")
    vim.api.nvim_win_set_buf(0, buf)
end

return M
