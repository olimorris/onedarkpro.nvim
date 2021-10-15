# onedark.nvim

<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/137557705-552567e4-a0f9-48e1-aa2a-8010b731d65d.png" alt="onedark.nvim" />
</p>
<p align="center">
  <i>
    A dark and light theme for Neovim 0.5 and above, written in Lua<br>
    <b>Fully customisable with ability to override styles, colors and highlight groups</b><br>
    Comes complete with support for <b>Treesitter</b> syntax highlighting and <b>many popular plugins</b><br><br>
      Inspired by VS Code's <a href="https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme">One Dark Pro</a>
  </i>
</p>

## :book: Table of Contents

- [Features](#sparkles-features)
- [Screenshots](#camera-screenshots)
  - [Dark](#dark)
  - [Light](#light)
  - [Color guide](#color-guide)
  - [Comparison to One Dark Pro](#comparison-to-one-dark-pro)
- [Requirements](#zap-requirements)
- [Installation](#package-installation)
- [Configuration](#wrench-configuration)
  - [Setup](#setup)
  - [Default configuration](#default-configuration)
  - [Configuring the theme](#configuring-the-theme)
  - [Configuring styles](#configuring-styles)
  - [Configuring colors](#configuring-colors)
  - [Configuring highlight groups](#configuring-highlight-groups)
  - [Configuring options](#configuring-options)
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
#### Python
<img src="https://user-images.githubusercontent.com/9512444/137556870-ee47b2ea-b9e2-4b56-8d82-2e99da249af4.png" alt="Dark Python" />

#### React
<img src="https://user-images.githubusercontent.com/9512444/137556833-f45452ff-e63b-421c-bf73-e867207972ed.png" alt="Dark React" />

### Light
#### Python
<img src="https://user-images.githubusercontent.com/9512444/137556929-77ddb821-53fc-4bd7-a5dc-f0c67729249b.png" alt="Light Python" />

#### React
<img src="https://user-images.githubusercontent.com/9512444/137556949-0829b6e3-d1f6-453d-b225-1aae1d1ccfe0.png" alt="Light React" />

### Color guide
#### Dark
<img src="https://user-images.githubusercontent.com/9512444/137557537-33bb3987-2ea4-4feb-8369-0c972efd3ac7.png" alt="Dark colors" />

#### Light
<img src="https://user-images.githubusercontent.com/9512444/137557516-cad11b2d-7688-4956-83d2-60cf607374b4.png" alt="Light colors" />

### Comparison to One Dark Pro
Comparison to the <a href="https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme">One Dark Pro</a> theme from VS Code:<br><br>
<img src="https://user-images.githubusercontent.com/9512444/137559154-76309841-5f75-4f2e-a620-2e4aa4def002.png"
alt="Comparison to One Dark Pro">

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

### Default configuration
The theme's default configuration as per the [config.lua](https://github.com/olimorris/onedark.nvim/blob/master/lua/onedark/config.lua) file:

```lua
local onedark = require('onedark')
onedark.setup({
  theme = "onedark", -- The theme to be used (opts: 'onedark' or 'onelight')
  colors = {}, -- Override default colors
  hlgroups = {}, -- Override default highlight groups
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      highlight_cursorline = false, -- Use cursorline highlighting?
  }
})
onedark.load()
```

### Configuring the theme
Use either `onedark` or `onelight` for the dark and light themes, respectively.

```lua
local onedark = require('onedark')
onedark.setup({
  theme = 'onedark', -- Or
  theme = 'onelight'
})
onedark.load()
```

### Configuring styles
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

### Configuring colors
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

### Configuring highlight groups
The [theme](https://github.com/olimorris/onedark.nvim/tree/master/lua/onedark/theme.lua) uses a large array of highlight groups. There are three ways to customize them:
1. Using specifc hex colors
2. Referencing the name of color variables from the color files
3. Linking to other highlight groups in the theme

```lua
local onedark = require('onedark')
onedark.setup({
  hlgroups = {
    Comment = { fg = '#FF0000', bg = '#FFFF00' }, -- 1
    Comment = { fg = '${red}' bg = '${yellow}' }, -- 2
    Comment = { link = 'Substitute' }, -- 3
   }
})
onedark.load()
```

### Configuring options

#### Formatting
Alongside `styles`, the theme also has implements some minor opinions formatting. These can be found in the [theme.lua](https://github.com/olimorris/onedark.nvim/tree/master/lua/onedark/theme.lua) file with `style` options containing `theme.*` values.

The default options can be configured with the following:

```lua
local onedark = require('onedark')
onedark.setup({
  options = {
    bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = true, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
  }
})
onedark.load()
```

#### Cursorline
Cursorline highlighting is supported in the theme using a `cursorline` color (which may of course be overriden). This can be enabled with the following:

```lua
local onedark = require('onedark')
onedark.setup({
  colors = {
    cursorline = '#FF0000' -- This is optional. The default cursorline color is based on the background
  },
  options = {
    highlight_cursorline = true
  }
})
onedark.load()
```

## :clap: Credits

The following themes were used, *heavily*, as an inspiration:

* [Nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) - For the general functionality of the theme which I used as the base
* [Onedark.vim](https://github.com/joshdick/onedark.vim) - For the colors and their application

## :page_with_curl: License

[MIT](https://github.com/olimorris/onedark.nvim/blob/master/LICENSE.md)
