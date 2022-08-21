if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
  !git -C plenary.nvim reset --hard 1338bbe8ec6503ca1517059c52364ebf95951458
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
vim.g.onedark_testing = true
local onedarkpro = require("onedarkpro")
local palette = {
    fg = '#abb2bf',
    pmenu = '#333841',
}
local p = palette
onedarkpro.setup({
    theme = "onedark",
    highlights = {
        Pmenu = { fg = p.fg, bg = p.pmenu },
        NormalFloat = { link = 'Pmenu' },
    },
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command Test4 PlenaryBustedFile tests/004_spec.lua

