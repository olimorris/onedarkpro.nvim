# onedark.nvim
My personal onedark port for Neovim.

> **Please Note:** The previous version of this theme has been moved to the **lush** branch of this repository.

## Styles

### Dark
![Dark](https://user-images.githubusercontent.com/9512444/131382995-d2378741-954e-4f03-9b73-b514be3d4464.png "Dark")

### Light
![Light](https://user-images.githubusercontent.com/9512444/131383409-e4686a46-8943-4e73-af57-14bba8863512.png "Light")

## Features
- **Dark** and **light** versions
- Options to specify styles for:
    - Comments
    - Functions
    - Keywords
    - Strings
    - Variables
- Override default colors and highlight groups
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- [LSP](https://github.com/neovim/nvim-lspconfig) diagnostics support
- Support for a large array of [vim-polygot](https://github.com/sheerun/vim-polyglot) packs (pull requests welcome)
- Support for populat plugins:
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
use 'olimorris/onedark.nvim'
```

## Usage
Add the following to your `init.lua` file to start using the theme:

```lua
require('onedark').load()
```
Alternaively, if you're using vimscript:

```lua
colorscheme onedark
```

### Setting the specific theme

Use `onedark` for the dark and `onelight` for the light theme:

```lua
local onedark = require('onedark')
onedark.setup({
  theme = 'onelight'
})
onedark.load()
```

### Styles

Styles can be set using the following settings:

```lua
local onedark = require('onedark')
onedark.setup({
  styles = {
    comments = "italic",
    functions = "NONE",
    keywords = "bold,italic",
    strings = "NONE",
    variables = "NONE"
  }
})
onedark.load()
```

Where **italic**, **bold**, **underline** and **NONE** are the settings accepted by Neovim.

> Also note that multiple styles can be passed using a comma. For example **bold,italic**.

### Overriding colors

The theme has a colour pallette of 12 core colors with 7 additional colors for tems such as borders and indentlines. These colors can be found in the color files, located [here](https://github.com/olimorris/onedark.nvim/tree/master/lua/onedark/colors).

To override any of them, use the following settings as an example:

```lua
local onedark = require('onedark')
onedark.setup({
  colors = {
    red = '#FF0000'
  }
})
onedark.load()
```

### Overriding highlight groups

The theme uses a large array of highlight groups. These can be found in the `theme.lua` file which is located [here](https://github.com/olimorris/onedark.nvim/blob/master/lua/onedark/theme.lua).

There are three ways to specify your own highlight groups:

1. Using specifc hex colors.
2. Referencing the name of color variables from the color files; *and* 
3. Referencing other highlight groups in the theme.

These are outlined in the below snippet:

```lua
local onedark = require('onedark')
onedark.setup({
  hlgroups = {
    --Comment = {fg = '#FF0000'}, OR
    --Comment = {fg = '${purple}'}, OR
    Comment = {'Substitute'},
   }
})
onedark.load()
```

## Credits

The following themes were used, *heavily*, as an inspiration:

* [Nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) - For the general functionality of the theme which I used as the base
* [Onedark.vim](https://github.com/joshdick/onedark.vim) - For the colors and their appication

## License

[MIT](https://github.com/olimorris/onedark.nvim/blob/master/LICENSE.md)
