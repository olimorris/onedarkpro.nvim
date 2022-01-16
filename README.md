# OneDarkPro.nvim

<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/149496458-f7c6f560-9d31-4877-9267-ec02b7eff660.png" alt="OneDarkPro.nvim" />
</p>
<p align="center">
  <i>
    Dark and light themes for Neovim 0.5 and above, written in Lua<br>
    <b>Treesitter enabled / Fully customisable / Many popular plugins supported</b><br>
    Inspired by VS Code's <a href="https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme">One Dark Pro</a>
  </i>
</p>

## :book: Table of Contents

- [Features](#sparkles-features)
- [Screenshots](#camera-screenshots)
  - [Dark](#dark)
  - [Light](#light)
  - [Comparison to VS Code's One Dark Pro](#comparison-to-vs-codes-one-dark-pro)
  - [Lualine](#lualine)
  - [Color guide](#color-guide)
- [Requirements](#zap-requirements)
- [Installation](#package-installation)
- [Configuration](#wrench-configuration)
  - [Setup](#setup)
  - [Default configuration](#default-configuration)
  - [Configuring the theme](#configuring-the-theme)
  - [Configuring plugins](#configuring-plugins)
  - [Configuring styles](#configuring-styles)
  - [Configuring colors](#configuring-colors)
  - [Configuring highlight groups](#configuring-highlight-groups)
  - [Configuring options](#configuring-options)
- [Extras](#gift-extras)
  - [Terminal themes](#terminal-themes)
  - [Helper functions](#helper-functions)
- [Credits](#clap-credits)
- [License](#page_with_curl-license)

## :sparkles: Features
- **Dark** and **light** versions - *onedark* and *onelight*
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- Options to specify styles for:
    - Comments
    - Functions
    - Keywords
    - Strings
    - Variables
- Override default styles, colors and highlight groups
- Create custom highlight groups
- [LSP](https://github.com/neovim/nvim-lspconfig) diagnostics support
- Support for a large array of [vim-polygot](https://github.com/sheerun/vim-polyglot) packs (pull requests welcome)
- Support for popular plugins:
    - [aerial.nvim](https://github.com/stevearc/aerial.nvim)
    - [barbar.nvim](https://github.com/romgrk/barbar.nvim)
    - [Dashboard](https://github.com/glepnir/dashboard-nvim)
    - [Hop.nvim](https://github.com/phaazon/hop.nvim)
    - [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim/tree/lua)
    - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
    - [marks.nvim](https://github.com/chentau/marks.nvim)
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - [nvim-dap](https://github.com/mfussenegger/nvim-dap)
    - [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
    - [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
    - [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
    - [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
    - [packer.nvim](https://github.com/wbthomason/packer.nvim)
    - [Startify](https://github.com/mhinz/vim-startify)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
    - [Trouble](https://github.com/folke/trouble.nvim)
    - [Ultest](https://github.com/rcarriga/vim-ultest)
    - [Which Key](https://github.com/folke/which-key.nvim)

## :camera: Screenshots
### Dark
<img src="https://user-images.githubusercontent.com/9512444/149405694-3716d755-8ed2-4378-ad5d-81a3e24ceb9b.png" alt="Dark" />

### Light
<img src="https://user-images.githubusercontent.com/9512444/149405705-738c6af8-c11f-49ba-b789-d40a2cc4c17e.png" alt="Light" />

> **Note:** All screenshots have Treesitter highlighting enabled

### Comparison to VS Code's One Dark Pro
#### Python
<img src="https://user-images.githubusercontent.com/9512444/149497007-76f39b96-5803-44db-b0f2-ae76837c6040.png" alt="Comparison to VS Code - Python" />

#### React
<img src="https://user-images.githubusercontent.com/9512444/149497024-75d040d4-5983-4aae-a04a-415e0e70acce.png" alt="Comparison to VS Code - React" />

### Lualine
#### Dark
<img src="https://user-images.githubusercontent.com/9512444/149409187-9538bda2-1b28-49ca-b71d-cb8cc6e1d67e.png" alt="Lualine Dark" />

#### Light
<img src="https://user-images.githubusercontent.com/9512444/149409208-712c1a96-a439-4929-b7a7-ecb8d8b1c6f5.png" alt="Lualine Light" />

### Color guide
#### Dark
<img src="https://user-images.githubusercontent.com/9512444/149406202-f3e3335f-0f3a-46c5-8df1-55c7c1a8eac4.png" alt="Dark colors" />

#### Light
<img src="https://user-images.githubusercontent.com/9512444/149406241-2f091619-879a-498c-a106-d86b1d8dfcd7.png" alt="Light colors" />

## :zap: Requirements
- Neovim 0.5 or greater
- `termguicolors` enabled for true color support
- `treesitter` for full syntax highlighting

## :package: Installation
Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'olimorris/onedarkpro.nvim'
```

Alternatively, if using Vimscript and [vim-plug](https://github.com/junegunn/vim-plug):

```lua
call plug#begin('~/.config/nvim/plugged')
  Plug 'olimorris/onedarkpro.nvim'
call plug#end()
```

## :wrench: Configuration

### Setup
Add the following to an `init.lua` file to start using the theme:

```lua
require('onedarkpro').load()
```

Alternatively, if using Vimscript:

```lua
colorscheme onedarkpro
```

The `vim.o.background` option may be used to set the theme:

```lua
vim.o.background = "dark" -- to load onedark
vim.o.background = "light" -- to load onelight
require("onedarkpro").load()
```
> **Note:** This assumes that no value for `theme` is set in the setup function (see below) 

### Default configuration
The theme's default configuration as per the [config.lua](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/onedarkpro/config.lua) file is:

```lua
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string!
  theme = function()
    if vim.o.background == "dark" then
      return "onedark"
    else
      return "onelight"
    end
  end,
  colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes by passing in a table
  hlgroups = {}, -- Override default highlight groups
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
      -- Others omitted for brevity
  },
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
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
onedarkpro.load()
```

### Configuring the theme
Use either `onedark` or `onelight` for the dark and light themes, respectively.

```lua
theme = "onedark", -- [onedark/onelight] 
```
If no value is specified, the current value of `vim.o.background` will be used to set the theme.

### Configuring plugins
By default, all the plugins supported by the theme are loaded at runtime. Specific plugins can be disabled as follows:

```lua
plugins = {
  native_lsp = false,
  polygot = false,
  treesitter = false,
}
```

> **Note:** For a full list of plugins, see the plugins [folder](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/plugins)

### Configuring styles
Styles can be set by specifying the highlight group from the [theme.lua](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/onedarkpro/theme.lua) file alongside any desired styles:

```lua
styles = {
  comments = "italic",
  functions = "NONE",
  keywords = "bold,italic",
  strings = "NONE",
  variables = "NONE"
}
```

Where **italic**, **bold**, **underline** and **NONE** are possible values for styles.

> **Note:** Multiple styles can be passed using a comma. For example `bold,italic`

### Configuring colors
The theme has a palette of 13 core colors alongside many additional ones used for menus and git diffs. These colors can be found in the [color files](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/colors).

The default colors can be changed by specifying the name of the color and the new hex code:
```lua
colors = {
  red = "#FF0000"
}
```
#### Specifying new colors
New colors may be specified which will then be merged into the theme's color palette:
```lua
colors = {
  my_new_red = "#f44336"
}
```
> **Note:** Custom colors can be referenced in highlight group overrides

#### Specifying colors by theme
It's possible to override default colors within the theme such as the `bg` color. This is a common question for those who wish to have a darker background than the default. Of course it would make sense to have different `bg` colors for the `onedark` and `onelight` themes. This can be achieved by specifying the theme name as a table, followed by the color:

```lua
colors = {
  onedark = {
    bg = "#FFFF00", -- yellow
  },
  onelight = {
    bg = "#00FF00", -- green
  },
}
```

### Configuring highlight groups
The [theme.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/theme.lua) file and [plugins](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/plugins) use a large array of highlight groups. There are three ways to customize them:
1. Using specific hex colors
2. Referencing the name of color variables
3. Linking to other highlight groups in the theme

```lua
hlgroups = { -- Overriding the Comment highlight group
  Comment = { fg = "#FF0000", bg = "#FFFF00", style = "italic" }, -- 1
  Comment = { fg = "${my_new_red}" bg = "${yellow}", style = "bold,italic" }, -- 2
  Comment = { link = "Substitute" }, -- 3
}
```

### Configuring options

#### Formatting
Alongside styles, the theme applies some opinionated formatting. These can be found in the [theme.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/theme.lua) file with `style` options containing `theme.*` values.

These can be configured with the following options:

```lua
options = {
  bold = true, -- Use the themes opinionated bold styles?
  italic = true, -- Use the themes opinionated italic styles?
  underline = true, -- Use the themes opinionated underline styles?
  undercurl = true, -- Use the themes opinionated undercurl styles?
}
```

#### Transparency
The theme supports transparent backgrounds:

```lua
options = {
  transparency = true
}
```

By setting the transparency option to true, the `Normal`, `Folded`, `SignColumn`, `Statusline` and `Tabline`  groups will have a `NONE` background color. Additional transparency may be achieved by overriding more highlight groups.

#### Terminal Colors
The theme supports changing the colors for Neovim's `:terminal`:

```lua
options = {
  terminal_colors = true
}
```

#### Window Focus Color
The theme supports changing the color of the main window in Neovim when focussed is lost. For example, when a `telescope` or `packer` pop up appears:

```lua
options = {
  window_unfocussed_color = true
}
```

> **Note:** This can be seen in the [Python screenshots](#python) above where `nvim-tree` is opened and out of focus

#### Cursorline
Cursorline highlighting is supported in the theme using a `cursorline` color (which may of course be overriden). This can be enabled with the following:
```lua
colors = {
  cursorline = "#FF0000" -- This is optional. The default cursorline color is based on the background
},
options = {
  cursorline = true
}
```

## :gift: Extras

### Terminal themes
The theme comes with [Alacritty](https://github.com/alacritty/alacritty) and [Kitty](https://github.com/kovidgoyal/kitty) themes. These can be found in the [extras](https://github.com/olimorris/onedarkpro.nvim/tree/main/extras) folder.

### Helper functions

#### Theme color tables
To enable plugins to match this theme, a helper function, `get_colors()`, has been included. This returns a table of the theme's current colors.

```lua
local colors = require("onedarkpro").get_colors("onelight")
print(colors.purple) -- #9a77cf
```

Changing the theme from `onelight` to `onedark` would return a new table of colors.

> **Note:** Setting a `ColorScheme` autocommand which refreshes the configuration of the relevant plugin will ensure that they are using the correct colors from **One Dark Pro**

#### Toggling between Onedark and Onelight
To enable the easy switching between themes, the following helper function could be used:

```lua
function ToggleTheme()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  require("onedarkpro").load()
end
```

## :clap: Credits

### Contributors
Thanks to the following contributors for their work on the theme:

* [mmirus](https://github.com/mmirus) - [contributions](https://github.com/olimorris/onedarkpro.nvim/commits?author=mmirus)

### Inspiration
The following themes were used as an inspiration:

* [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) - The inspiration for this theme
* [Nightfox](https://github.com/EdenEast/nightfox.nvim) - Originally used the theme's layout and utilities however moved away quite significantly since 
* [onedark.vim](https://github.com/joshdick/onedark.vim) - For the application of `onedark` colors in Neovim
* [GitHub nvim theme](https://github.com/projekt0n/github-nvim-theme) - For the logo inspiration :wink:

## :page_with_curl: License

[MIT](https://github.com/olimorris/onedark.nvim/blob/main/LICENSE.md)
