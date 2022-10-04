local M = {}

function M.show()
    local buf = vim.api.nvim_create_buf(true, true)

    local line = 0
    for color, hex in pairs(vim.g.onedarkpro_colors) do
        vim.api.nvim_buf_set_lines(buf, line, (line + 1), false, {
            color .. " = \"" .. tostring(hex) .. "\""
        })
        line = line + 1
    end

    vim.api.nvim_buf_set_option(buf, "modifiable", false)
    vim.api.nvim_buf_set_option(buf, "filetype", "Onedarkpro")
    vim.api.nvim_buf_set_name(buf, "OneDarkPro Colors")
    vim.api.nvim_win_set_buf(0, buf)
end

return M
