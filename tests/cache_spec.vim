if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test"),
})

local util = require("onedarkpro.utils")
local cache_path, _ = require("onedarkpro.config").get_cached_info()

vim.g.fingerprint = util.hash(util.join_paths(cache_path, "fingerprint"))
vim.g.user_config_hash = util.hash(util.join_paths(cache_path, "user_config_hash"))
vim.g.onedark_compiled = util.hash(util.join_paths(cache_path, "onedark_compiled"))
vim.g.onelight_compiled = util.hash(util.join_paths(cache_path, "onelight_compiled"))

vim.cmd [[colorscheme onedark]]
EOF

runtime plugin/plenary.vim
command CacheSpec PlenaryBustedFile tests/cache_spec.lua

