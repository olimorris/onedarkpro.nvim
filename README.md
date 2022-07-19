# OneDarkPro.nvim

![MIT License](https://img.shields.io/github/license/olimorris/onedarkpro.nvim) [![Tests](https://github.com/olimorris/onedarkpro.nvim/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/olimorris/onedarkpro.nvim/actions/workflows/ci.yml)

<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/178539095-e17ee384-a9b9-49bc-8b76-f3711074c88c.png" alt="OneDarkPro.nvim" />
</p>
<p align="center">
    Highly customisable Neovim theme. With support for custom colors, styles and filetype highlights<br>
    <i>Support for Treesitter, LSP and a variety of plugins</i><br>
    Inspired by VS Code's <a href="https://github.com/Binaryify/OneDark-Pro">One Dark Pro</a>
</p>

## :book: Table of Contents

- [Features](#sparkles-features)
- [Screenshots](#camera-screenshots)
- [Requirements](#zap-requirements)
- [Installation](#package-installation)
- [Configuration](#wrench-configuration)
  - [Setup](#setup)
  - [Default configuration](#default-configuration)
  - [Configuring themes](#configuring-themes)
  - [Configuring plugins](#configuring-plugins)
  - [Configuring styles](#configuring-styles)
  - [Configuring colors](#configuring-colors)
  - [Configuring highlight groups](#configuring-highlight-groups)
  - [Configuring filetype highlight groups](#configuring-filetype-highlight-groups)
  - [Configuring options](#configuring-options)
- [Extras](#gift-extras)
  - [Terminal themes](#terminal-themes)
  - [Helpers](#helpers)
- [Credits](#clap-credits)
- [License](#page_with_curl-license)

## :sparkles: Features

- **Dark** and **light** versions - _onedark_ and _onelight_
- Supports **custom highlighting across filetypes**
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- Options to specify styles for:
  - Comments
  - Functions
  - Keywords
  - Strings
  - Variables
  - Virtual text
- Override default styles, colors, highlight groups and filetype highlight groups
- Create custom highlight groups
- [LSP](https://github.com/neovim/nvim-lspconfig) diagnostics support
- Support for a large array of [vim-polygot](https://github.com/sheerun/vim-polyglot) packs (pull requests welcome)
- Support for popular plugins:
  - [aerial.nvim](https://github.com/stevearc/aerial.nvim)
  - [barbar.nvim](https://github.com/romgrk/barbar.nvim)
  - [Copilot.vim](https://github.com/github/copilot.vim)
  - [Dashboard](https://github.com/glepnir/dashboard-nvim)
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - [Hop.nvim](https://github.com/phaazon/hop.nvim)
  - [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim/tree/lua)
  - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
  - [marks.nvim](https://github.com/chentau/marks.nvim)
  - [Neotest](https://github.com/nvim-neotest/neotest)
  - [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
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

### Onedark

<img src="https://user-images.githubusercontent.com/9512444/178539204-1b4b6b2a-653c-4ed3-b2e4-d0ebfda18c00.png" alt="Onedark" />

**with Telescope**

<img src="https://user-images.githubusercontent.com/9512444/178539282-4914e2ce-b1e6-447b-92c2-f1efd4e25e86.png" alt="Onedark Telescope" />

### Onelight

<img src="https://user-images.githubusercontent.com/9512444/178539496-c98e2210-006d-4489-8f3d-eca9293f23bf.png" alt="Onelight" />

**with Telescope**

<img src="https://user-images.githubusercontent.com/9512444/178539657-6740e567-02c9-46cc-8c18-ccc11f46223e.png" alt="Onelight Telescope" />

### Onedark Vivid

<img src="https://user-images.githubusercontent.com/9512444/178539827-0f376e2c-37bd-4f38-8aa2-1d3115557ddc.png" alt="Onedark Vivid" />

### Onedark Dark

<img src="https://user-images.githubusercontent.com/9512444/178539884-b9377c3c-6754-49d2-ae8d-b1d29d90519a.png" alt="Onedark Dark" />

> **Note:** All screenshots have Treesitter highlighting enabled

### Comparison to VS Code's One Dark Pro

#### Python

<img src="https://user-images.githubusercontent.com/9512444/178540087-bda08b3c-fab3-422f-bcb2-46a521de4738.png" alt="Comparison to VS Code - Python" />

#### React

<img src="https://user-images.githubusercontent.com/9512444/178540105-73dd2fa9-282b-4332-8bae-1ba26a8551cc.png" alt="Comparison to VS Code - React" />

> **Note:** A greater likeness to Visual Studio Code can be achieved by using the theme's ability to [customise highlight groups by filetype](#configuring-filetype-highlight-groups)

### Lualine

#### Dark

<img src="https://user-images.githubusercontent.com/9512444/153061323-19fd0bd2-5838-470f-9273-ea85a5813319.png" alt="Lualine Dark" />

#### Light

<img src="https://user-images.githubusercontent.com/9512444/149409208-712c1a96-a439-4929-b7a7-ecb8d8b1c6f5.png" alt="Lualine Light" />

### Color guide

#### Dark

<img src="https://user-images.githubusercontent.com/9512444/179700545-c8ac75ba-9469-45d6-a91b-6f35db4e5efb.png" alt="Dark colors" />

#### Light

<img src="https://user-images.githubusercontent.com/9512444/179700558-9ed5d35b-ff24-4dfb-a833-62f3dcb1c363.png" alt="Light colors" />

## :zap: Requirements

- Neovim 0.5 or greater
- `termguicolors` enabled for true color support
- `treesitter` for full syntax highlighting

## :package: Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use({
  "olimorris/onedarkpro.nvim",
  config = function()
    require("onedarkpro").setup()
  end
})
```

The theme can then be loaded with:

```lua
vim.cmd("colorscheme onedarkpro")
```

Alternatively, if using Vimscript and [vim-plug](https://github.com/junegunn/vim-plug):

```vim
call plug#begin('~/.config/nvim/plugged')
  Plug 'olimorris/onedarkpro.nvim'
call plug#end()

colorscheme onedarkpro
```

## :wrench: Configuration

### Default configuration

The theme's default configuration as per the [config.lua](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/onedarkpro/config.lua) file is:

```lua
require("onedarkpro").setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  -- The theme function can be overwritten with a string value for the theme
  theme = function()
      if vim.o.background == "dark" then
          return config.dark_theme
      else
          return config.light_theme
      end
  end,
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  hlgroups = {}, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  plugins = { -- Override which plugins highlight groups are loaded
      -- NOTE: Plugins have been omitted for brevity - Please see the plugins section of the README
  },
  styles = { -- Choose from "bold,italic,underline"
      strings = "NONE", -- Style that is applied to strings.
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
      virtual_text = "NONE", -- Style that is applied to virtual text
  },
  options = {
      bold = false, -- Use the themes opinionated bold styles?
      italic = false, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
```

### Configuring themes

Currently, there are four themes available:

- `onedark`
- `onelight`
- `onedark_vivid`
- `onedark_dark`

A default theme can be set with:

```lua
theme = "onedark_vivid",
```

If no value is specified, the theme will use the values as per the default config. This results in the value of `vim.o.background` option to set the theme. With a dark background, the theme will use `onedark` and with a light background, `onelight`. For greater customisation with the `vim.o.background` option, default dark and light themes can be set:

```lua
dark_theme = "onedark_vivid",
light_theme = "onelight",
```

### Configuring plugins

> **Note:** For a full list of plugins supported in the theme, see the plugins [folder](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/plugins)

By default, all of the plugins supported by the theme are loaded at runtime. Specific plugins can be disabled as follows:

```lua
plugins = {
  native_lsp = false,
  polygot = false,
  treesitter = false
}
```

Alternatively, all of the plugins can be disabled at once:

```lua
plugins = {
  all = false
}
```

Or, all of the plugins can be disabled with only a select few enabled:

```lua
plugins = {
  all = false
  native_lsp = true,
  treesitter = true
}
```

### Configuring styles

Within the theme, collections of highlight groups have been grouped together into `styles`. For users who use monospaced fonts with nice italics, this can go someway to adding greater customisation to the theme. These styles may be configured as below:

```lua
styles = {
  comments = "italic",
  functions = "NONE",
  keywords = "bold,italic",
  strings = "NONE",
  variables = "NONE",
  virtual_text = "NONE"
}
```

Where **italic**, **bold**, **underline** and **NONE** are possible values for styles.

### Configuring colors

The theme has a palette of 13 core colors alongside many additional ones used for menus and git diffs. These colors can be found in the [color files](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/colors).

The default colors can be changed by specifying the name of the color and the new hex code:

```lua
colors = {
  red = "#FF0000"
}
```

#### Specifying new colors

New colors may be defined which will then be merged into the theme's color palette:

```lua
colors = {
  my_new_red = "#f44336"
}
```

> **Note:** Custom colors can also be referenced when creating custom highlight group overrides in `hlgroups`

#### Specifying colors by theme

It's possible to override default colors within the theme such as the `bg` color. This is a common question for those who wish to have a darker background than the default. Of course it would make sense to have different `bg` colors for the `onedark` and `onelight` themes. This can be achieved by specifying the theme name as a table, followed by the color:

```lua
colors = {
  onedark = {
    bg = "#FFFF00" -- yellow
  },
  onelight = {
    bg = "#00FF00" -- green
  }
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
  Comment = { link = "Substitute" } -- 3
}
```

### Configuring filetype highlight groups

The original <a href="https://binaryify.github.io/OneDark-Pro">One Dark Pro</a> utilises custom highlights based on filetype to achieve its distinctive look. This can also be achieved within the theme:

```lua
filetype_hlgroups = {
  yaml = { -- Use the filetype as per the `set filetype?` command
    TSField = { fg = "${red}" }
  },
  python = {
    TSConstructor = { fg = "${bg}", bg = "${red}" }
  }
}
```

> **Note:** Currently support for highlighting in Telescope's previewer is unavailable.

> **Note:** Please see [this issue](https://github.com/olimorris/onedarkpro.nvim/issues/24) for how other users are configuring their theme by filetype

> **Note:** The excellent [hlargs.nvim](https://github.com/m-demare/hlargs.nvim) plugin allows for greater customisation over arguments definitions and usages

#### Ignoring filetypes and buffer types

Filetype highlight groups work by detecting the filetype of the current buffer and checking the user's config to determine if any should be applied. As the user moves between buffers, the theme checks for a filetype change and applies any new highlights as neccessary.

When using common plugins such as [Telescope](https://github.com/nvim-telescope/telescope.nvim) or [Trouble](https://github.com/folke/trouble.nvim), additional windows with distinct filetypes are opened. This can cause the theme to reapply the default highlight groups as it detects a buffer filetype change. When closing the windows, the user's custom filetype highlight groups are then lost. To prevent this from happening, the theme has a table of filetypes and buffer types to ignore:

```lua
filetype_hlgroups_ignore = {
  filetypes = {
    "^aerial$",
    "^alpha$",
    "^fugitive$",
    "^fugitiveblame$",
    "^help$",
    "^NvimTree$",
    "^packer$",
    "^qf$",
    "^startify$",
    "^startuptime$",
    "^TelescopePrompt$",
    "^TelescopeResults$",
    "^terminal$",
    "^toggleterm$",
    "^undotree$"
  },
  buftypes = {
    "^terminal$"
  }
```

Additional filetypes and buffer types can be added in the config.

### Configuring options

#### Formatting

Alongside styles, the theme applies some opinionated formatting. These can be found in the [theme.lua](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/theme.lua) file with `style` options containing `theme.*` values.

These can be configured with the following options:

```lua
options = {
  bold = true, -- Use the themes opinionated bold styles?
  italic = true, -- Use the themes opinionated italic styles?
  underline = true, -- Use the themes opinionated underline styles?
  undercurl = true -- Use the themes opinionated undercurl styles?
}
```

#### Transparency

The theme supports transparent backgrounds:

```lua
options = {
  transparency = true
}
```

By setting the transparency option to true, the `Normal`, `Folded`, `SignColumn`, `Statusline` and `Tabline` groups will have a `NONE` background color. Additional transparency may be achieved by overriding more highlight groups.

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

### Helpers

#### Theme color tables

To enable the theme's colors to be extracted and used elsewhere in the Neovim config, a helper function, `get_colors()`, has been included. This returns a table of the theme's current colors.

```lua
local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)
print(colors.purple) -- #9a77cf
```

> **Note:** The global variable `vim.g.onedarkpro_style` automatically detects whether to use the `onedark` or `onelight` theme.

#### Toggling between Onedark and Onelight

To enable the easy switching between themes, the following helper function could be used:

```lua
function ToggleTheme()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end
```

#### Configuring styles/colors/highlight groups based on the theme

When configuring the theme, it may be useful to apply different colors or styles depending on whether `onedark` or `onelight` is active. This can be achieved by applying a conditional in the configuration:

```lua
hlgroups = {
  TSField = {
    fg = (vim.o.background == "dark" and "${red}" or "${green}")
  }
}
```

## :clap: Credits

### Contributors

Thanks to the following contributors for their work on the theme:

- [mmirus](https://github.com/mmirus) - [contributions](https://github.com/olimorris/onedarkpro.nvim/commits?author=mmirus)

### Inspiration

The following themes were used as an inspiration:

- [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) - The inspiration for this theme
- [GitHub nvim theme](https://github.com/projekt0n/github-nvim-theme) - For the logo inspiration :wink:

## :page_with_curl: License

[MIT](https://github.com/olimorris/onedark.nvim/blob/main/LICENSE.md)
