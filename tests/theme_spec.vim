if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
local color = require("onedarkpro.lib.color")
local colors = onedarkpro.get_colors("onedark_vivid")

onedarkpro.setup({
    dark_theme = "onedark_vivid",
    colors = {
        onedark_vivid = {
            -- Choosing a color which is different between onedark and onedark_vivid
            medium_purple = color.lighten(colors.purple, 0.85, nil),
        },
    },
    highlights = {
        IlluminatedWordText = { bg = "${medium_purple}" },
    },
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command ThemeSpec PlenaryBustedFile tests/theme_spec.lua

