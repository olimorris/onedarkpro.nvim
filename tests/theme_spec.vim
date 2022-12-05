if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
local color = require("onedarkpro.lib.color")
onedarkpro.setup({
    colors = {
        onedark_vivid = {
            medium_gray = color.lighten("${bg}", 0.85, nil),
        },
    },
    highlights = {
        IlluminatedWordText = { bg = "${medium_gray}" },
    },
})
vim.cmd [[colorscheme onedark_vivid]]
EOF

runtime plugin/plenary.vim
command ThemeSpec PlenaryBustedFile tests/theme_spec.lua

