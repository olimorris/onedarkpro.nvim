# OneDarkPro.nvim

<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/137961273-46abc097-4a7f-4dfb-8adc-b80191af9f6d.png" alt="OneDarkPro.nvim" />
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
  - [Comparison to VS Code's One Dark Pro](#comparison-to-vs-codes-one-dark-pro)
  - [Lualine](#lualine)
  - [Color guide](#color-guide)
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
    - [barbar.nvim](https://github.com/romgrk/barbar.nvim)
    - [Dashboard](https://github.com/glepnir/dashboard-nvim)
    - [Hop](https://github.com/phaazon/hop.nvim)
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
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
    - [Trouble](https://github.com/folke/trouble.nvim)
    - [vim-ultest](https://github.com/rcarriga/vim-ultest)
    - [vim-startify](https://github.com/mhinz/vim-startify)
    - [Which Key](https://github.com/folke/which-key.nvim)

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

> **Note:** All screenshots have Treesitter highlighting enabled

### Comparison to VS Code's One Dark Pro
#### Python
<img src="https://user-images.githubusercontent.com/9512444/138352820-2ba95c7e-b399-46f4-b6b4-f50f6ceaea34.png" alt="Comparison to VS Code - Python" />

#### React
<img src="https://user-images.githubusercontent.com/9512444/138353070-59215e32-c7c2-458e-8454-0c1564e03d26.png" alt="Comparison to VS Code - React" />

### Lualine
#### Dark
<img src="https://user-images.githubusercontent.com/9512444/141958202-77a8e021-d396-496d-87bf-2803bade6717.png" alt="Lualine Dark" />

#### Light
<img src="https://user-images.githubusercontent.com/9512444/141958282-b1ce4e97-a1a3-4d99-acc1-74ca510f7296.png" alt="Lualine Light" />

### Color guide
#### Dark
<img src="https://user-images.githubusercontent.com/9512444/138352749-4500f5d7-87cd-485f-8640-d1e2910e45ba.png" alt="Dark colors" />

#### Light
<img src="https://user-images.githubusercontent.com/9512444/138352643-382fccda-b33a-43a0-9397-abc15f792427.png" alt="Light colors" />

## :zap: Requirements
- Neovim 0.5 or greater
- `termguicolors` enabled for true color support
- `treesitter` for full syntax highlighting

## :package: Installation
Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'olimorris/onedarkpro.nvim'
```

Alternatively, if you're using Vimscript and [vim-plug](https://github.com/junegunn/vim-plug):

```lua
call plug#begin('~/.config/nvim/plugged')
  Plug 'olimorris/onedarkpro.nvim'
call plug#end()
```

## :wrench: Configuration

### Setup
Add the following to your `init.lua` file to start using the theme:

```lua
require('onedarkpro').load()
```

Alternatively, if you're using Vimscript:

```lua
colorscheme onedarkpro
```

> **Note:** You can use `vim.o.background` to set the theme

```lua
vim.o.background = "light" -- to load onelight
require('onedarkpro').load()
```

### Default configuration
The theme's default configuration as per the [config.lua](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/onedarkpro/config.lua) file is:

```lua
local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  theme = function(), -- Override with "onedark" or "onelight". Alternatively, remove the option and the theme uses `vim.o.background` to determine
  colors = {}, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
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
theme = 'onedark', -- [onedark/onelight] 
```
If you don't specify any value for `theme`, then the current value of `vim.o.background` will be used to set the theme.

### Configuring styles
Styles can be set by specifying the highlight group from the [theme.lua](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/onedarkpro/theme.lua) file alongside your desired styles:

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
The theme has a palette of 13 core colors and 7 additional colors (for both `onelight` and `onedark` themes). These colors can be found in the [color files](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/colors).

The default colors can be changed by specifying the name of the color and the new hex code:
```lua
colors = {
  red = '#FF0000'
}
```
#### Specifying new colors
You can specify new colors which will be merged into the theme's color palette:
```lua
colors = {
  my_new_red = '#f44336'
}
```
> **Note:** Your custom colors can be referenced in highlight group overrides

#### Specifying colors by theme
As an example, you may wish to change the theme's default `bg` color. Of course it would make sense to have different `bg` colors for the `onedark` and `onelight` themes. This can be achieved by specifying the theme name as a table, followed by the color:
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
The [theme](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/theme.lua) uses a large array of highlight groups. There are three ways to customize them:
1. Using specifc hex colors
2. Referencing the name of color variables
3. Linking to other highlight groups in the theme

```lua
hlgroups = {
  Comment = { fg = '#FF0000', bg = '#FFFF00', style = "italic" }, -- 1
  Comment = { fg = '${my_new_red}' bg = '${yellow}', style = "bold,italic" }, -- 2
  Comment = { link = 'Substitute' }, -- 3
}
```

### Configuring options

#### Formatting
Alongside `styles`, the theme applies some opinionated formatting to match VS Code's One Dark Pro. These can be found in the [theme.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/theme.lua) file with `style` options containing `theme.*` values.

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

By setting the transparency option to `true`, the `Normal`, `Folded`, `SignColumn`, `Statusline` and `Tabline`  groups will have a `NONE` background color. Additional transparency can be applied by overriding the highlight groups.

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
  cursorline = '#FF0000' -- This is optional. The default cursorline color is based on the background
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
To enable your plugins to match this theme, a helper function, `get_colors()`, has been included. This returns a table of the theme's current colors.

```lua
local colors = require("onedarkpro").get_colors("onelight")
print(colors.purple) -- #9a77cf
```

Changing the theme from `onelight` to `onedark` would return a new table of colors.

> **Note:** Setting a `ColorScheme` autocommand which refreshes the configuration of your relevant plugin will ensure that they are using the correct colors from **One Dark Pro**

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
The following themes were used, *heavily*, as an inspiration:

* [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) - The inspiration for this theme
* [Nightfox](https://github.com/EdenEast/nightfox.nvim) - For the general functionality of the theme which I used as the base
* [onedark.vim](https://github.com/joshdick/onedark.vim) - For the original colors and their application in Neovim

## :page_with_curl: License

[MIT](https://github.com/olimorris/onedark.nvim/blob/main/LICENSE.md)
