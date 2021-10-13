# onedark.nvim

<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/136255115-2ab2706a-5dfb-44dd-9936-96961716827f.png" alt = "banner" />
</p>
<p align="center">
  <i>
    A dark and light theme for Neovim 0.5 and above, written in Lua<br>
    <b>Fully customisable with ability to override styles, colors and highlight groups</b><br>
    Comes complete with support for <b>Treesitter</b> syntax highlighting and <b>many popular plugins</b>
  </i>
</p>

## :book: Table of Contents

- [Features](#sparkles-features)
- [Screenshots](#camera-screenshots)
  - [Dark](#dark)
  - [Light](#light)
  - [Color reference](#color-reference)
- [Requirements](#zap-requirements)
- [Installation](#package-installation)
- [Configuration](#wrench-configuration)
  - [Setup](#setup)
  - [Setting the dark or light theme](#setting-the-dark-or-light-theme)
  - [Changing styles](#changing-styles)
  - [Changing default colors](#changing-default-colors)
  - [Customising highlight groups](#customizing-highlight-groups)
  - [Enabling the cursorline](#enabling-the-cursorline)
- [Credits](#clap-credits)
- [License](#page_with_curl-license)

## :sparkles: Features
- **Dark** and **light** versions
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- Options to specify styles for:
    - Comments
    - Functions
    - Keywords
    - Strings
    - Variables
- Override default colors and highlight groups
- Create custom highlight groups
- [LSP](https://github.com/neovim/nvim-lspconfig) diagnostics support
- Support for a large array of [vim-polygot](https://github.com/sheerun/vim-polyglot) packs (pull requests welcome)
- Support for popular plugins:
    - [barbar.nvim](https://github.com/romgrk/barbar.nvim)
    - [cokeline.nvim](https://github.com/noib3/cokeline.nvim)
    - [Dashboard](https://github.com/glepnir/dashboard-nvim)
    - [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim/tree/lua)
    - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - [nvim-dap](https://github.com/mfussenegger/nvim-dap)
    - [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
    - [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
    - [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [vim-ultest](https://github.com/rcarriga/vim-ultest)
    - [vim-startify](https://github.com/mhinz/vim-startify)

## :camera: Screenshots
### Dark
![Dark](https://user-images.githubusercontent.com/9512444/131382995-d2378741-954e-4f03-9b73-b514be3d4464.png "Dark")

### Light
![Light](https://user-images.githubusercontent.com/9512444/131383409-e4686a46-8943-4e73-af57-14bba8863512.png "Light")

### Color Reference
#### Dark
<img src="https://user-images.githubusercontent.com/9512444/136249668-0939e37e-23e4-48a3-af1d-44fc7190e12e.png" alt="Dark colors" />

#### Light
<img src="https://user-images.githubusercontent.com/9512444/136249706-990609bd-3404-4bbb-ae37-77de437f28dd.png" alt="Dark colors" />

## :zap: Requirements
- Neovim 0.5 or greater
- `termguicolors` enabled for true color support
- `treesitter` for full syntax highlighting

## :package: Installation
Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'olimorris/onedark.nvim'
```

Alternatively, if you're using Vimscript and [vim-plug](https://github.com/junegunn/vim-plug):
```lua
call plug#begin('~/.config/nvim/plugged')
  Plug 'olimorris/onedark.nvim'
call plug#end()
```

## :wrench: Configuration

### Setup
Add the following to your `init.lua` file to start using the theme:

```lua
require('onedark').load()
```

Alternatively, if you're using Vimscript:
```lua
colorscheme onedark
```

### Setting the dark or light theme

Use either `onedark` or `onelight` for the dark and light themes, respectively.

```lua
local onedark = require('onedark')
onedark.setup({
  theme = 'onedark', -- Or
  theme = 'onelight'
})
onedark.load()
```

### Changing styles

Styles can be set by specifying the highlight group from the [theme.lua](https://github.com/olimorris/onedark.nvim/blob/master/lua/onedark/theme.lua) file alongside your desired style:

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

Where **italic**, **bold**, **underline** and **NONE** are possible values for styles.

> **Note:** Multiple styles can be passed using a comma. For example `bold,italic`

### Changing default colors

The theme has a palette of 12 core colors and 7 additional colors (for both light and dark themes). These colors can be found in the [color files](https://github.com/olimorris/onedark.nvim/tree/master/lua/onedark/colors).

The default colors can be changed by specifying the name of the color and the new hex code:
```lua
local onedark = require('onedark')
onedark.setup({
  colors = {
    red = '#FF0000'
  }
})
onedark.load()
```

### Customizing highlight groups
The [theme](https://github.com/olimorris/onedark.nvim/tree/master/lua/onedark/theme.lua) uses a large array of highlight groups. There are three ways to customize them:
1. Using specifc hex colors.
2. Referencing the name of color variables from the color files; *and* 
3. Referencing other highlight groups in the theme.

```lua
local onedark = require('onedark')
onedark.setup({
  hlgroups = {
    Comment = { fg = '#FF0000', bg = '#FFFF00' }, -- 1
    Comment = { fg = '${red}' bg = '${yellow}' }, -- 2
    Comment = { 'Substitute' }, -- 3
   }
})
onedark.load()
```

### Enabling the cursorline
Cursorline highlighting is supported in the theme using a `cursorline` color (which may of course be overriden). This can be enabled with the following:

```lua
local onedark = require('onedark')
onedark.setup({
  colors = {
    cursorline = '#FF0000' -- This is optional. The default cursorline color is based on the background
  },
  highlight_cursorline = true
})
onedark.load()
```

## :clap: Credits

The following themes were used, *heavily*, as an inspiration:

* [Nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) - For the general functionality of the theme which I used as the base
* [Onedark.vim](https://github.com/joshdick/onedark.vim) - For the colors and their application

## :page_with_curl: License

[MIT](https://github.com/olimorris/onedark.nvim/blob/master/LICENSE.md)
