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
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test/"),
    styles = {
        variables = "bold"
    },
    options = {
        bold = false,
        italic = true,
        terminal_colors = true
    },
    plugins = {
        all = false,
        treesitter = true,
    },
    colors = {
        onedark_vivid = {
            red = "#e06c75", -- Overwrite red to onedark's red
            oli_color = "#ff00ff",
            diff_add = "#ff0000"
        },
        onelight = {
            oli_color = "#f0f0f0",
        }
    },
    highlights = {
        Repeat = {
            fg = "${blue}"
        },
        Statement = {
            fg = "${oli_color}"
        },
        TestHighlightGroup = {
            fg = "${red}"
        },
        TestHighlightGroup2 = { link = "Statement" }
    },
})
vim.cmd [[colorscheme onedark_vivid]]
EOF

runtime plugin/plenary.vim
command ConfigSpec PlenaryBustedFile tests/config_spec.lua

