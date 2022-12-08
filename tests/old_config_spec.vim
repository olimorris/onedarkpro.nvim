if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")

onedarkpro.setup({
    theme = "onelight",
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command OldConfigSpec PlenaryBustedFile tests/old_config_spec.lua

