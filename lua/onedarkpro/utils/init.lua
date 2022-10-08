local M = {}

M.use_nvim_api = vim.fn.has("nvim-0.7") == 1
M.use_filetype_highlights = vim.fn.has("nvim-0.8") == 1

return M
