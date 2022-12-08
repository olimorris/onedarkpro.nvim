if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")

onedarkpro.setup({
    dark_theme = "onedark_vivid",
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command OldConfigSpec2 PlenaryBustedFile tests/old_config_spec2.lua

