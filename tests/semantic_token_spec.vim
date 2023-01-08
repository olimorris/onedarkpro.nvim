if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
endif
if !isdirectory('lsp_zero.nvim')
  !git clone https://github.com/VonHeikemen/lsp-zero.nvim.git lsp_zero.nvim
endif

set runtimepath+=plenary.nvim,.
set runtimepath+=lsp_zero.nvim,.
set noswapfile
set noundofile

lua << EOF
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
    'sumneko_lua',
})
lsp.set_preferences({
  suggest_lsp_servers = false,
  set_lsp_keymaps = false,
  configure_diagnostics = false,
  cmp_capabilities = false,
  manage_nvim_cmp = false,
})
lsp.setup()

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

runtime plugin/plenary.vim
command SemanticTokenSpec PlenaryBustedFile tests/semantic_token_spec.lua

