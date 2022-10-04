local M = {}

local function get_max_length(tbl)
    local max_length = 0

    for key, _ in pairs(tbl) do
        if #key > max_length then
            max_length = #key
        end
    end

    return max_length
end

function M.show()
    local buf = vim.api.nvim_create_buf(true, true)

    local max_length = get_max_length(vim.g.onedarkpro_colors)

    local line = 0
    for color, hex in pairs(vim.g.onedarkpro_colors) do
        local whitespace = max_length - #color
        vim.api.nvim_buf_set_lines(buf, line, (line + 1), false, {
            color .. string.rep(" ", whitespace) .. " = \"" .. tostring(hex) .. "\""
        })
        line = line + 1
    end

    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "filetype", "Onedarkpro")
    vim.api.nvim_buf_set_name(buf, "OneDarkPro Colors")
    vim.api.nvim_win_set_buf(0, buf)
end

return M
