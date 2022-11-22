if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
  !git -C plenary.nvim reset --hard 1338bbe8ec6503ca1517059c52364ebf95951458
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    filetypes = {
        ruby = false
    },
    plugins = {
        all = false,
        treesitter = true,
    },
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command LoadFilesSpec PlenaryBustedFile tests/load_files_spec.lua

