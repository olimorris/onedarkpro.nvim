<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/197140436-6617b2b7-1b03-4b4f-b81e-38a8ac27ef98.png" alt="OneDarkPro.nvim" />
</p>

<h1 align="center">OneDarkPro.nvim</h1>

<p align="center">
<a href="https://github.com/olimorris/onedarkpro.nvim/stargazers"><img src="https://img.shields.io/github/stars/olimorris/onedarkpro.nvim?color=c678dd&logoColor=e06c75&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/issues"><img src="https://img.shields.io/github/issues/olimorris/onedarkpro.nvim?color=%23d19a66&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/blob/main/LICENSE"><img src="https://img.shields.io/github/license/olimorris/onedarkpro.nvim?color=%2361afef&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/actions/workflows/ci.yml"><img src="https://img.shields.io/github/workflow/status/olimorris/onedarkpro.nvim/Tests?label=tests&style=for-the-badge"></a>
</p>

<p align="center">
    Highly customisable Neovim colorscheme. With support for custom colors, styles and highlights by filetype<br>
    Inspired by VS Code's <a href="https://github.com/Binaryify/OneDark-Pro">One Dark Pro</a>
</p>

<div align="center">
  <h3>onedark</h3><img src="https://user-images.githubusercontent.com/9512444/197142107-e7ae293b-1afa-499d-87c9-71531eb59930.png" alt="onedark" />
  <h3>onelight</h3><img src="https://user-images.githubusercontent.com/9512444/197142172-3466567e-650c-4ffa-af0d-50d29a789575.png" alt="onelight" />
  <h3>onedark_vivid</h3><img src="https://user-images.githubusercontent.com/9512444/197142228-3baacc62-dc43-4600-8c4f-224639e1e635.png" alt="onedark vivid" />
  <h3>onedark_dark</h3><img src="https://user-images.githubusercontent.com/9512444/197142302-e1de9d96-7e7e-474b-a318-870417e2741b.png" alt="onedark dark" />
</div>

## :book: Table of Contents

- [Features](#sparkles-features)
- [Requirements](#zap-requirements)
- [Installation](#package-installation)
- [Usage](#rocket-usage)
- [Configuration](#wrench-configuration)
  - [Default configuration](#default-configuration)
  - [Configuring themes](#configuring-themes)
  - [Configuring colors](#configuring-colors)
  - [Configuring highlight groups](#configuring-highlight-groups)
  - [Configuring filetype highlighting](#configuring-filetype-highlighting)
  - [Configuring plugins](#configuring-plugins)
  - [Configuring styles](#configuring-styles)
  - [Configuring options](#configuring-options)
  - [Configuring caching](#configuring-caching)
- [Supported Plugins](#electric_plug-supported-plugins)
- [Screenshots](#camera_flash-screenshots)
- [Extras](#gift-extras)
- [FAQs](#question-faqs)
- [Credits](#clap-credits)

## :sparkles: Features

- Filetype highlights
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support
- Support for many [popular plugins](#electric_plug-supported-plugins)
- Override everything! Default styles, colors, highlight groups and filetype groups
- Create custom highlight groups and even highlight groups by filetypes
- Cache your configuration to improve startup times

## :zap: Requirements

- Neovim 0.5+ (0.8+ for filetype highlights)
- `termguicolors` enabled for true color support
- `treesitter` for full syntax highlighting

## :package: Installation

Install with your package manager:

```lua
use "olimorris/onedarkpro.nvim"    -- Packer
```

```vim
Plug 'olimorris/onedarkpro.nvim'   " Vim-Plug
```

## :rocket: Usage

Use the built-in `:colorscheme` command to load:

```lua
vim.cmd("colorscheme onedarkpro")  -- Lua
```

```vim
colorscheme onedarkpro             " Vimscript
```

Other useful commands:

- `:OnedarkproCache` generates a fresh cache file for the current colorscheme
- `:OnedarkproClean` will remove the cache file from disk for the current colorscheme
- `:OnedarkproColors` will output all of the colors in the current colorscheme to a scratch buffer

## :wrench: Configuration

### Default configuration

A call to the `setup` function is only required if you wish to change the default values listed below:

```lua
require("onedarkpro").setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  caching = false, -- Use caching for the theme?
  cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  highlights = {}, -- Override default highlight and/or filetype groups
  filetypes = { -- Override which filetype highlight groups are loaded
    javascript = true,
    lua = true,
    markdown = true,
    php = true,
    python = true,
    ruby = true,
    rust = true,
    toml = true,
    typescript = true,
    typescriptreact = true,
    vue = true,
    yaml = true,
  },
  plugins = { -- Override which plugin highlight groups are loaded
    -- See the Supported Plugins section for a list of available plugins
  },
  styles = { -- Choose from "bold,italic,underline"
    types = "NONE", -- Style that is applied to types
    numbers = "NONE", -- Style that is applied to numbers
    strings = "NONE", -- Style that is applied to strings
    comments = "NONE", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    constants = "NONE", -- Style that is applied to constants
    functions = "NONE", -- Style that is applied to functions
    operators = "NONE", -- Style that is applied to operators
    variables = "NONE", -- Style that is applied to variables
    conditionals = "NONE", -- Style that is applied to conditionals
    virtual_text = "NONE", -- Style that is applied to virtual text
  },
  options = {
    bold = true, -- Use bold styles?
    italic = true, -- Use italic styles?
    underline = true, -- Use underline styles?
    undercurl = true, -- Use undercurl styles?

    cursorline = false, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    window_unfocused_color = false, -- When the window is out of focus, change the normal background?
  }
})
```

> **Note:** You only need to include values that you wish to change from the defaults!

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

If no value is specified, the colorscheme will use the value of the `dark_theme` and/or `light_theme` config option; with
`vim.o.background` being used to determine whether to use the dark or light theme:

```lua
dark_theme = "onedark_dark",
light_theme = "onelight",
```

For users who wish to have a light theme during daylight hours and a dark theme during the night, it is recommended to
_not_ set a value for `theme` and instead use the `dark_theme` and `light_theme` options.

### Configuring colors

The colorscheme has a palette of 13 core colors alongside many additional ones which are used for menus and git diffs. These colors can be found in the [themes](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/themes).

The default colors can be changed by specifying the name of the color and a new hex code:

```lua
colors = {
  red = "#FF0000"
}
```

#### Specifying new colors

New colors may be created which will then be merged into a theme's color palette:

```lua
colors = {
  my_new_red = "#f44336"
}
```

> **Note:** Custom colors can also be referenced when creating custom highlight group overrides

#### Specifying colors by theme

It's possible to override default colors within a theme such as the `bg` color. This is a common question for those who wish to have a darker background than the default. Of course it would make sense to have different `bg` colors for the `onedark` and `onelight` themes. This can be achieved by specifying the theme name as a table, followed by the color:

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

The [editor](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/editor.lua), [syntax](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/syntax.lua), [filetype](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/filetypes) and [plugin](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/plugins) files use a large array of highlight groups. There are three ways to customize or _override_ them:

1. Using specific hex colors:

```lua
highlights = {
  Comment = { fg = "#FF0000", bg = "#FFFF00" }
}
```

2. Referencing the name of colors:

```lua
highlights = {
  Comment = { fg = "${my_new_red}" bg = "${yellow}" }
}
```

3. Linking to other highlight groups:

```lua
highlights = {
  Comment = { link = "Substitute" }
}
```

### Configuring filetype highlighting

> **Note: Filetype highlighting only works in Neovim 0.8 and above**

The colorscheme supports opinionated highlighting for filetypes, just like the original VS Code theme. By default, all of the filetypes supported are loaded at runtime. The colorscheme currently has support for:

- `javascript`
- `lua`
- `markdown`
- `php`
- `python`
- `ruby`
- `rust`
- `toml`
- `typescript`
- `typescriptreact`
- `vue`
- `yaml`

Please see the [Contributing](https://github.com/olimorris/onedarkpro.nvim/blob/main/CONTRIBUTING.md) guide if you would like add support for new filetypes.

Specific filetypes can be disabled as follows:

```lua
filetypes = {
  markdown = false,
  ruby = false,
}
```

Alternatively, all of the filetypes can be disabled:

```lua
filetypes = {
  all = false
}
```

Or, all of the filetypes can be disabled with a select few enabled:

```lua
filetypes = {
  all = false
  markdown = true
  ruby = true,
}
```

#### Adding or modifying filetype highlights

It's likely that you'll wish to add additional filetype highlights or even change the defaults. This can be achieved by
adding them as custom highlight groups in the colorscheme:

```lua
highlights = {
  ["@field.yaml"] = { fg = "${blue}", style = "italic" }
}
```

In the example above, we have set the `field` treesitter highlight group to be blue, but only when the filetype is `yaml`. More information can be found via `:h treesitter-highlight-groups`.

To determine which highlight group to add or modify, see the [FAQ](#question-faqs) section for instructions on
using Treesitter Playground.

> **Note:** The colorscheme's defaults can be found in the `/lua/onedarkpro/highlights/filetypes` directory

### Configuring plugins

By default, all of the plugins supported by the theme are loaded at runtime. Specific plugins can be disabled as follows:

```lua
plugins = {
  native_lsp = false,
  polygot = false,
  treesitter = false
}
```

Alternatively, all of the plugins can be disabled:

```lua
plugins = {
  all = false
}
```

Or, all of the plugins can be disabled with a select few enabled:

```lua
plugins = {
  all = false
  native_lsp = true,
  treesitter = true
}
```

> **Note:** For a full list of plugins supported, and their names, see the plugins [section](#electric_plug-supported-plugins)

### Configuring styles

Within the colorscheme, collections of highlight groups have been grouped together into `styles`. For users who use monospaced fonts with nice italics, this can go someway to enhancing the aesthetic of the colorscheme. These styles may be configured as shown in the example below:

```lua
styles = {
  types = "NONE",
  numbers = "NONE",
  strings = "NONE",
  comments = "italic",
  keywords = "bold,italc",
  constants = "NONE",
  functions = "italic",
  operators = "NONE",
  variables = "NONE",
  conditionals = "italic",
  virtual_text = "NONE",
}
```

> **Note:** See the [Neovim help](<https://neovim.io/doc/user/api.html#nvim_set_hl()>) for a full list of styles

### Configuring options

#### Formatting

Alongside styles, the colorscheme enables additional formatting options; often used in combination with filetype highlighting. These can be turned on or off:

```lua
options = {
  bold = true,
  italic = false,
  underline = false,
  undercurl = true
}
```

#### Transparency

The colorscheme supports transparent backgrounds:

```lua
options = {
  transparency = true
}
```

By setting the transparency option to true, the `Normal`, `Folded`, `SignColumn`, `Statusline` and `Tabline` groups will have `NONE` as the background color. Additional transparency may be achieved by overriding more highlight groups.

#### Terminal Colors

The colorscheme supports changing the colors for Neovim's `:terminal` to the current theme:

```lua
options = {
  terminal_colors = true
}
```

#### Window Focus Color

The colorscheme supports changing the color of the main window in Neovim when the focus is lost. For example, when a `telescope` or `packer` pop up appears:

```lua
options = {
  window_unfocused_color = true
}
```

> **Note:** This can be seen in the screenshots above where `nvim-tree` is opened and out of focus

#### Cursorline

Cursorline highlighting is supported in the colorscheme using a `cursorline` color (which may of course be overridden). This can be enabled with the following:

```lua
colors = {
  cursorline = "#FF0000" -- This is optional. The default cursorline color is based on the background
},
options = {
  cursorline = true
}
```

### Configuring caching

To enable a faster load time, the colorscheme supports caching. This works by caching highlight groups to disk instead
of processing them when Neovim starts. Initial testing suggests you may see a 3x improvement in the colorscheme's boot time if you have a complex configuration.

Note that with caching enabled, if you change your theme config (e.g., custom highlights), you must reload your updated config and then regenerate the cache before your change will take effect.

To enable caching:

```lua
require("onedarkpro").setup({
  caching = true
})
```

> **Note:** The default path to the cache is `~/.cache/nvim/onedarkpro/`. This can be changed with the `cache_path`
> config variable

#### Generating a cache

A cache can be generated by running `:OnedarkproCache`. The colorscheme will then detect if a cache is present when
Neovim starts.

> **Note:** The cache will be automatically generated if `caching = true` and no cache file is present; but it will not
> regenerate automatically

To automatically re-generate the cache, an autocommand unique to your configuration should be used.

#### Cleaning a cache

A cache may be cleaned by running `:OnedarkproClean`. This will remove the cache file from disk.

## :electric_plug: Supported Plugins

The colorscheme supports the following plugins:

- [aerial.nvim](https://github.com/stevearc/aerial.nvim) (`aerial`)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim) (`barbar`)
- [Copilot.vim](https://github.com/github/copilot.vim) (`copilot`)
- [Dashboard](https://github.com/glepnir/dashboard-nvim) (`dashboard`)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) (`gitsigns`)
- [Hop.nvim](https://github.com/phaazon/hop.nvim) (`hop`)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim/tree/lua) (`indentline`)
- [leap.nvim](https://github.com/ggandor/leap.nvim) (`leap`)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) (`lsp_saga`)
- [marks.nvim](https://github.com/chentau/marks.nvim) (`marks`)
- [Neotest](https://github.com/nvim-neotest/neotest) (`neotest`)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) (`neo_tree`)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (`nvim_cmp`)
- [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) (`nvim_bqf`)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) (`nvim_dap`)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) (`nvim_dap_ui`)
- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) (`nvim_hlslens`)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) (`native_lsp`)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic) (`nvim_navic`)
- [nvim-notify](https://github.com/rcarriga/nvim-notify) (`nvim_notify`)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) (`nvim_tree`)
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow) (`nvim_ts_rainbow`)
- [op.nvim](https://github.com/mrjones2014/op.nvim) (`op_nvim`)
- [packer.nvim](https://github.com/wbthomason/packer.nvim) (`packer`)
- [polygot](https://github.com/sheerun/vim-polyglot) (`polygot`)
- [startify](https://github.com/mhinz/vim-startify) (`startify`)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (`telescope`)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) (`toggleterm`)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`treesitter`)
- [Trouble](https://github.com/folke/trouble.nvim) (`trouble`)
- [Vim Ultest](https://github.com/rcarriga/vim-ultest) (`vim_ultest`)
- [Which Key](https://github.com/folke/which-key.nvim) (`which_key`)

## :camera_flash: Screenshots

### Lua

<img src="https://user-images.githubusercontent.com/9512444/196185422-3f0bfe75-772e-40ff-9ca8-b26e1eff13dc.png" alt="Lua" />

### Python

<img src="https://user-images.githubusercontent.com/9512444/196185335-8fb99002-227d-42e2-a2d4-b3cf9fc21a17.png" alt="Python" />

### Javascript/React

<img src="https://user-images.githubusercontent.com/9512444/196185397-a963a7b7-c7e3-45ff-b1bd-bd9344e9616a.png" alt="Javascript/React" />

### Ruby

<img src="https://user-images.githubusercontent.com/9512444/196185441-6cba7191-63d0-4dd3-abde-12b99ed4bec6.png" alt="Ruby" />

## :gift: Extras

### Lualine

The colorscheme has Lualine support out of the box for all of its themes. This can be found in the [Lualine
folder](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/lualine/themes/onedarkpro.lua).

### Terminal themes

The colorscheme comes with [Alacritty](https://github.com/alacritty/alacritty) and [Kitty](https://github.com/kovidgoyal/kitty) themes. These can be found in the [extras](https://github.com/olimorris/onedarkpro.nvim/tree/main/extras) folder.

### Helpers

#### Theme color tables

To enable the theme's colors to be extracted and used elsewhere in the Neovim config, a helper function, `get_colors()`, has been included. This returns a table of the theme's current colors.

```lua
local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_theme)
print(colors.purple) -- #9a77cf
```

> **Note:** The global variable `vim.g.onedarkpro_theme` represents the currently loaded theme

You can also use the command `:OnedarkproColors` to open a scratch buffer with the colors from the currently loaded theme. This then allows a colorizer plugin to highlight the colors.

#### Toggling between themes

To enable the easy switching between dark and light themes, the following helper function could be used:

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

When configuring the colorscheme, it may be useful to apply different colors or styles depending on whether `onedark` or `onelight` is active. This can be achieved by applying a conditional in the configuration:

```lua
highlights = {
  TSField = {
    fg = (vim.o.background == "dark" and "${red}" or "${green}")
  }
}
```

## :question: FAQs

#### I want to change X highlight group but I don't know what it is. How do I find out?

If you're using Treesitter then install [Playground](https://github.com/nvim-treesitter/playground) as this gives you access to the powerful `:TSHighlightCapturesUnderCursor` command. This shows any treesitter or syntax highlight groups under the cursor.

#### I want to automatically generate the cache file. How do I do it?

This can be achieved by creating a `ColorScheme` autocommand that runs the `:OnedarkproCache` command. The author uses
this to automatically generate a new cache file when a new theme is toggled.

## :clap: Credits

### Contributors

Thanks to the following contributors for their work on the colorscheme:

- [mmirus](https://github.com/mmirus) - [contributions](https://github.com/olimorris/onedarkpro.nvim/commits?author=mmirus)
- [mrjones2014](https://github.com/mrjones2014) - [contributions](https://github.com/olimorris/onedarkpro.nvim/commits?author=mrjones2014)

### Inspiration

The following colorschemes were used as an inspiration:

- [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) - The inspiration for this colorscheme
- [Nightfox](https://github.com/EdenEast/nightfox.nvim) - For the beautiful code base and structure
- [GitHub nvim theme](https://github.com/projekt0n/github-nvim-theme) - For the logo inspiration
