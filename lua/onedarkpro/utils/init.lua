local M = {}

M.has_nvim_07 = vim.fn.has("nvim-0.7") == 1
M.has_nvim_08 = vim.fn.has("nvim-0.8") == 1

return M
