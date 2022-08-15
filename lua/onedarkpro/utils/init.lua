local M = {}

M.use_nvim_api = vim.fn.has("nvim-0.7") == 1

return M
