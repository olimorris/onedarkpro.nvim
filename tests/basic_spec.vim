if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command BasicSpec PlenaryBustedFile tests/basic_spec.lua

