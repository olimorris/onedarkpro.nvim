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
        dark_red = "require('onedarkpro.helpers').darken('red', 10, 'onedark')",
        light_blue = "require('onedarkpro.helpers').lighten('blue', 10, 'onelight')",
        bright_green = "require('onedarkpro.helpers').brighten('green', 10, 'onedark')",
        basic_red = "require('onedarkpro.helpers').darken('#FF0000', 5)",
    },
    highlights = {
        DarkHighlight = {
            fg = "${dark_red}",
        },
        LightHighlight = {
            fg = "${light_blue}",
        },
        BrightHighlight = {
            fg = "${bright_green}",
        },
        BasicRedHighlight = {
            fg = "${basic_red}",
        },
    },
    filetypes = {
        all = false,
    },
    plugins = {
        all = false,
    },
})
vim.cmd [[colorscheme onedark]]
EOF

runtime plugin/plenary.vim
command HelpersSpec PlenaryBustedFile tests/helpers_spec.lua

