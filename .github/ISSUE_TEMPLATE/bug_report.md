---
name: Bug report
about: General issue
title: ''
labels: bug
assignees: olimorris
---

**Test with minimal.lua file**
Firstly, please run and test with the minimal.lua file below.

> **Note:** I'll likely just ask you to recreate the issue if you don't

Run Neovim with this command:
```bash
nvim --clean -u minimal.lua
```

Using this `minimal.lua` file:

```lua
-- ignore default config and plugins
vim.opt.runtimepath:remove(vim.fn.expand("~/.config/nvim"))
vim.opt.packpath:remove(vim.fn.expand("~/.local/share/nvim/site"))

-- append test directory
local test_dir = "/tmp/onedarkpro"
vim.opt.runtimepath:append(vim.fn.expand(test_dir))
vim.opt.packpath:append(vim.fn.expand(test_dir))

-- install packer
local install_path = test_dir .. "/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.cmd("packadd packer.nvim")
    install_plugins = true
end

local packer = require("packer")

packer.init({
    package_root = test_dir .. "/pack",
    compile_path = test_dir .. "/plugin/packer_compiled.lua",
})

packer.startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("olimorris/onedarkpro.nvim")

    if install_plugins then
        packer.sync()
    end
end)

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
    treesitter.setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" }, -- list of parser which cause issues or crashes
        highlight = { enable = true },
    })
end

local ok, onedarkpro = pcall(require, "onedarkpro")
if ok then
    onedarkpro.setup({
        -- Your onedarkpro config here
    })
    vim.cmd("colorscheme onedarkpro")
end
```

**Paste the Neovim error**
```lua
-- Paste the error output here
```

**System information**
- OS: [windows/linux/mac]
- Neovim version (`nvim --version`):

**To reproduce**
If applicable, the steps to reproduce the behavior:
1.
2.
3.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Additional context**
Add any other context about the problem here.
