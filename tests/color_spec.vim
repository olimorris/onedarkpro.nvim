if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test/"),
    colors = {
        test_color = "require('onedarkpro.lib.color').from_hex('#e06c76'):darker(1):to_css()",
    },
    highlights = {
        Repeat = {
            fg = "${test_color}",
        },
    },
    filetypes = {
        all = false,
        javascript = true,
    },
    plugins = {
        all = false,
        treesitter = true,
    },
})
vim.cmd [[colorscheme onedark]]
EOF

runtime plugin/plenary.vim
command ColorSpec PlenaryBustedFile tests/color_spec.lua

