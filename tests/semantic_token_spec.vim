if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif
if !isdirectory('lsp_zero.nvim')
  !git clone https://github.com/VonHeikemen/lsp-zero.nvim.git lsp_zero.nvim
endif

set rtp^=plenary.nvim,lsp_zero.nvim,.
set noswapfile
set noundofile
runtime plugin/plenary.vim
runtime plugin/lsp-zero.vim

lua << EOF
local lsp = require('lsp-zero')
lsp.preset('lsp-only')
lsp.ensure_installed({
    'sumneko_lua',
})
lsp.on_attach(function(client, bufnr)
    print('LSP attached')
end)
lsp.setup()

vim.cmd("LspZeroSetupServers")

local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro_test/"),
    filetypes = {
        all = false,
    },
    plugins = {
        all = false,
        treesitter = true,
    },
    colors = {
        dark = {
            new_color = "#ff00ff", -- pink
        },
    },
    semantic_tokens = {
        default = {
            ["@declaration"] = { bg = "${new_color}" },
            ["@class"] = { bg = "${new_color}" },
        }
    }
})
vim.cmd [[colorscheme onedark]]
EOF

command SemanticTokenSpec PlenaryBustedFile tests/semantic_token_spec.lua

