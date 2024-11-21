set rtp+=.
set rtp+=./misc/plenary

lua << EOF
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test"),
})

local util = require("onedarkpro.utils")
local cache_path = require("onedarkpro.config").cache_path

-- Create timestamp hashes to compare to
vim.g.onedarkpro_hash = util.hash(util.join_paths(cache_path, "cache"))
vim.g.onedark_compiled = util.hash(util.join_paths(cache_path, "onedark_compiled"))
vim.g.onelight_compiled = util.hash(util.join_paths(cache_path, "onelight_compiled"))

vim.cmd [[colorscheme onedark]]
EOF

runtime! plugin/plenary.vim
command CacheSpec PlenaryBustedFile tests/cache_spec.lua

