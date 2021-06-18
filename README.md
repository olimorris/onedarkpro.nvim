# onedark.nvim
My personal One Dark port for Neovim, built on [Lush](https://github.com/rktjmp/lush.nvim).

### Dark
![Dark](screenshots/dark.png "Dark")

### Light
![Light](screenshots/light.png "Light")

## Features
- **Dark** and **light** versions
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- [LSP](https://github.com/neovim/nvim-lspconfig) support
- Support for a large array of [vim-polygot](https://github.com/sheerun/vim-polyglot) packs (pull requests welcome)
- Plugins:
    - [barbar.nvim](https://github.com/romgrk/barbar.nvim)
    - [Dashboard](https://github.com/glepnir/dashboard-nvim)
    - [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim/tree/lua)
    - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
    - [nvim-compe](https://github.com/hrsh7th/nvim-compe)
    - [nvim-dap](https://github.com/mfussenegger/nvim-dap)
    - [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
    - [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [vim-ultest](https://github.com/rcarriga/vim-ultest)
    - [vim-startify](https://github.com/mhinz/vim-startify)

## Requirements
- Neovim 0.5 or greater
- `termguicolors` enabled for true color support

## Installation
Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'olimorris/onedark.nvim',
    requires = 'rktjmp/lush.nvim'
}
```

## Usage
Add the following to your `init.lua` file to start using the theme:

```lua
vim.o.background = 'dark'
vim.g.colors_name = 'onedark_nvim'
```
> Note: Changing the background to `light` will enable the light version of the theme

### Overriding colors
The theme's color palettes are separated into two; *dark* and *light*. Each palette has 13 colors with the light colors being specified with a `_light` suffix. The full colors can be seen in the `onedark_nvim.lua` file, [here](lua/lush_theme/onedark_nvim.lua).

The colors can be overwritten by specifying an override attribute:

```lua
vim.g.onedark_override = {
      red = "#FF0000",
      red_light = "#e67780"
}
```

### Bolds, italics and underlines
By default, the theme has an opinionated choice on its use of bolds, italics and underlines. You can turn these off by using the following code:

```lua
vim.g.onedark_settings = {
    bold = false,
    italic = false,
    underline = false
}
```

### Theme toggling
You can use the example snippet to toggle between dark and light themes:

```lua
function ThemeToggle()
    if vim.api.nvim_get_option('background') == 'dark' then
        vim.api.nvim_set_option('background', 'light')
    else
        vim.api.nvim_set_option('background', 'dark')
    end
end
```

## License
[MIT](https://github.com/olimorris/onedark.nvim/blob/master/LICENSE.md)
