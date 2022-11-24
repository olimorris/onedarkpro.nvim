if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
  !git -C plenary.nvim reset --hard 1338bbe8ec6503ca1517059c52364ebf95951458
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
local palette = {
    fg = '#abb2bf',
    pmenu = '#333841',
}
local p = palette
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test/"),
    highlights = {
        Pmenu = { fg = p.fg, bg = p.pmenu },
        NormalFloat = { link = 'Pmenu' },
        Normal = { bg = p.pmenu },
        ModeMsg = { bg = "${red}", style = "italic", blend = 100 }
    },
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command LinkGroupsSpec PlenaryBustedFile tests/link_groups_spec.lua

