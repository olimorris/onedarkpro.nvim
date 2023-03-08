set rtp+=.
set rtp+=./misc/plenary

lua << EOF
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test/"),
    plugins = {
        all = false,
        treesitter = true,
    },
})
vim.cmd [[colorscheme onedark]]
EOF

runtime! plugin/plenary.vim
command SourceSpec PlenaryBustedFile tests/source_spec.lua

