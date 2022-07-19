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
    dark_theme = "onedark_vivid", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    styles = {
        variables = "bold"
    },
    options = {
        italic = true,
    },
    plugins = {
        all = false,
        treesitter = true,
    },
    colors = {
        onedark_vivid = {
            red = "#e06c75", -- Overwrite red to onedark's red
            oli_color = "#ff00ff",
        }
    },
    hlgroups = {
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
    filetype_hlgroups = {
        ruby = {
            Function = { fg = "${green}" }
        },
        lua = {
            Function = { fg = "${purple}" }
        },
    },
})
vim.cmd [[colorscheme onedarkpro]]
EOF

runtime plugin/plenary.vim
command Test2 PlenaryBustedFile tests/002_spec.lua

