<!-- panvimdoc-ignore-start -->

<p align="center">
<img src="https://user-images.githubusercontent.com/9512444/224169058-12b65186-dbad-4d16-8269-67eb7ba560c5.png" alt="OneDarkPro.nvim" />
</p>

<p align="center">
<a href="https://github.com/olimorris/onedarkpro.nvim/stargazers"><img src="https://img.shields.io/github/stars/olimorris/onedarkpro.nvim?color=c678dd&logoColor=e06c75&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/olimorris/onedarkpro.nvim/ci.yml?branch=main&label=tests&style=for-the-badge"></a>
<a href="https://github.com/olimorris/onedarkpro.nvim/releases"><img src="https://img.shields.io/github/v/release/olimorris/onedarkpro.nvim?style=for-the-badge"></a>
</p>

<p align="center">
    Atom's iconic One Dark theme for Neovim.<br>
    Fully customisable, with Tree-sitter, LSP semantic tokens and support for many common plugins.<br><br>
    Based on the amazing <a href="https://github.com/Binaryify/OneDark-Pro">One Dark Pro</a> theme for Visual Studio Code.
</p>

## :icecream: Themes

> [!NOTE]
> All bolds and italics in the screenshots below are [completely customisable](#configuring-styles). Additional screenshots of more languages can be found [here](https://github.com/olimorris/onedarkpro.nvim/issues/2#issuecomment-1937345197).

<div align="center">
  <p><strong>:new: Vaporwave</strong><img src="https://github.com/user-attachments/assets/37df30fa-e79d-44d2-af58-91d15152856c" alt="vaporwave" /></p>
  <p><strong>Onedark</strong><img src="https://github.com/olimorris/onedarkpro.nvim/assets/9512444/d1e15b89-0cec-4d5b-88b8-4a0246665cb4" alt="onedark" /></p>
  <p><strong>Onelight</strong><img src="https://github.com/olimorris/onedarkpro.nvim/assets/9512444/74736b59-f104-4d7f-b385-f8002f9c90d1" alt="onelight" /></p>
  <p><strong>Onedark Vivid</strong><img src="https://github.com/olimorris/onedarkpro.nvim/assets/9512444/8146401c-21cf-413b-bb18-85e39faea565" alt="onedark vivid" /></p>
  <p><strong>Onedark Dark</strong><img src="https://github.com/olimorris/onedarkpro.nvim/assets/9512444/cf9f0494-217e-4c8f-9857-aa1e4e56f7e1" alt="onedark dark" /></p>
</div>

<!-- panvimdoc-ignore-end -->

## :sparkles: Features

- :envelope_with_arrow: Automatic caching for faster load times
- :evergreen_tree: Full [Tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter) support and bespoke queries
- :tickets: Support for LSP semantic tokens
- :electric_plug: Support for many [popular plugins](#electric_plug-supported-plugins)
- :flashlight: Filetype highlighting to allow for greater customisation across different languages
- :memo: Override everything - styles, colors, tokens, highlight groups and filetype groups
- :paintbrush: Create custom highlight groups and even highlight groups by filetypes

## :zap: Requirements

- Neovim 0.9.2+
- `termguicolors` enabled for true color support
- `tree-sitter` for full syntax highlighting
- For semantic tokens, an LSP server that supports them

## :package: Installation and usage

Install with your package manager of choice:

```lua
-- Lazy
{
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
}

-- somewhere in your config:
vim.cmd("colorscheme onedark")
```

```lua
-- Packer
use "olimorris/onedarkpro.nvim"

-- somewhere in your config:
vim.cmd("colorscheme onedark")
```

```vim
" Vim-Plug
Plug "olimorris/onedarkpro.nvim"

" somewhere in your config:
colorscheme onedark
```

## :rocket: Commands

The colorscheme comes with some useful commands:

- `:OneDarkProCache` force generate new cache files for the themes (you won't often need this)
- `:OneDarkProClean` removes existing cache files for the themes
- `:OneDarkProColors` output all of the current themes colors to a scratch buffer
- `:OneDarkProExtras` generates the extras files from the `/extras` folder using your config

## :wrench: Configuration

**Default configuration**

> [!NOTE]
> You only need to the call the `setup` function if you wish to change any of the defaults.

<details>
  <summary>Click to see the default configuration</summary>

```lua
require("onedarkpro").setup({
  colors = {}, -- Override default colors or create your own
  highlights = {}, -- Override default highlight groups or create your own
  styles = { -- For example, to apply bold and italic, use "bold,italic"
    types = "NONE", -- Style that is applied to types
    methods = "NONE", -- Style that is applied to methods
    numbers = "NONE", -- Style that is applied to numbers
    strings = "NONE", -- Style that is applied to strings
    comments = "NONE", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    constants = "NONE", -- Style that is applied to constants
    functions = "NONE", -- Style that is applied to functions
    operators = "NONE", -- Style that is applied to operators
    variables = "NONE", -- Style that is applied to variables
    parameters = "NONE", -- Style that is applied to parameters
    conditionals = "NONE", -- Style that is applied to conditionals
    virtual_text = "NONE", -- Style that is applied to virtual text
  },
  filetypes = { -- Override which filetype highlight groups are loaded
    c = true,
    comment = true,
    go = true,
    html = true,
    java = true,
    javascript = true,
    json = true,
    latex = true,
    lua = true,
    markdown = true,
    php = true,
    python = true,
    ruby = true,
    rust = true,
    scss = true,
    toml = true,
    typescript = true,
    typescriptreact = true,
    vue = true,
    xml = true,
    yaml = true,
  },
  plugins = { -- Override which plugin highlight groups are loaded
    aerial = true,
    barbar = true,
    blink_cmp = true,
    codecompanion = true,
    copilot = true,
    dashboard = true,
    flash_nvim = true,
    gitgraph_nvim = true,
    gitsigns = true,
    hop = true,
    indentline = true,
    leap = true,
    lsp_saga = true,
    lsp_semantic_tokens = true,
    marks = true,
    mini_diff = true,
    mini_icons = true,
    mini_indentscope = true,
    mini_test = true,
    neotest = true,
    neo_tree = true,
    nvim_cmp = true,
    nvim_bqf = true,
    nvim_dap = true,
    nvim_dap_ui = true,
    nvim_hlslens = true,
    nvim_lsp = true,
    nvim_navic = true,
    nvim_notify = true,
    nvim_tree = true,
    nvim_ts_rainbow = true,
    op_nvim = true,
    packer = true,
    persisted = true,
    polygot = true,
    rainbow_delimiters = true,
    render_markdown = true,
    startify = true,
    telescope = true,
    toggleterm = true,
    treesitter = true,
    trouble = true,
    vim_ultest = true,
    which_key = true,
    vim_dadbod_ui = true,
  },

  options = {
    cursorline = false, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
    lualine_transparency = false, -- Center bar transparency?
    highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
  }
})
```

</details>

**Setting a theme**

Currently, there are five themes in the colorscheme:

- `onedark`
- `onelight`
- `onedark_vivid`
- `onedark_dark`
- `vaporwave`

A theme can be set with:

```lua
vim.cmd("colorscheme onedark")
```

**Configuring colors**

A theme has a palette of 13 core colors alongside many additional ones which are used for menus and git diffs for example. These colors can be found in the [themes](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/themes).

The default colors can be changed by specifying the name of the color and a new hex code:

```lua
require("onedarkpro").setup({
  colors = {
    red = "#FF0000"
  }
})
```

**Specifying new colors**

New colors may be created which will then be merged into a theme's color palette:

```lua
require("onedarkpro").setup({
  colors = {
    my_new_red = "#f44336",
    my_new_green = "require('onedarkpro.helpers').darken('green', 10, 'onedark')"
  }
})
```

> [!NOTE]
> See the [helpers](#rainbow-helpers) section to understand how to use the color helpers.

These can then be used for custom highlight groups if desired:

```lua
require("onedarkpro").setup({
  highlights = {
    Error = {
      fg = "${my_new_red}",
      bg = "${my_new_green}"
    },
  }
})
```

**Specifying colors by theme or background**

It's possible to override default colors within a theme such as the `bg` color. This is a common question for those who wish to have a darker background than the default. Of course it would make sense to have different `bg` colors for the `onedark` and `onelight` themes. This can be achieved by specifying the theme name as a table, followed by the color:

```lua
require("onedarkpro").setup({
  colors = {
    onedark = { bg = "#FFFF00" }, -- yellow
    onelight = { bg = "#00FF00" }, -- green
  }
})
```

Alternatively, you can specify colors by the theme's background color:

```lua
require("onedarkpro").setup({
  colors = {
    dark = { bg = "#FFFF00" }, -- yellow
    light = { bg = "#00FF00" }, -- green
  }
})
```

### Configuring highlight groups

The [editor](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/editor.lua), [syntax](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/syntax.lua), [filetype](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/filetypes) and [plugin](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/highlights/plugins) files use a large array of highlight groups. Some examples of how you can customize or _override_ them:

1. Using specific hex colors and styles:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = { fg = "#FF0000", bg = "#FFFF00", italic = true }
  }
})
```

2. Referencing the name of colors:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = { fg = "${my_new_red}", bg = "${yellow}", italic = true }
  }
})
```

3. Linking to other highlight groups:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = { link = "Substitute" }
  }
})
```

4. Extending existing highlight groups:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = { underline = true, extend = true }
  }
})
```

> [!NOTE]
> In the example above, an underline style has been applied to the existing `Comment` highlight group.

**Creating highlight groups**

You can also create your own highlight groups:

```lua
require("onedarkpro").setup({
  highlights = {
    MyNewHighlightGroup = { fg = "${red}" }
  }
})
```

or, if you'd like to disable certain highlight groups:

```lua
require("onedarkpro").setup({
  highlights = {
    ["@lsp.type.comment"] = {}
  }
})
```

> [!NOTE]
> This can be useful to prevent LSP servers from applying semantic highlights

**Specifying highlight attributes by theme or background**

As with colors, highlight attributes may be specified by using the theme name or the background color. For example:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = {
      fg = { onedark = "${yellow}", onelight = "${my_new_red}" }
    }
  }
})
```

Alternatively, by background color:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = {
      fg = { dark = "${yellow}", light = "${my_new_red}" }
    }
  }
})
```

**Namespacing highlight groups**

Neovim supports the application of highlights to specific buffers via [namespaces](https://neovim.io/doc/user/api.html#api-extmark). To apply highlight groups to a specific namespace, use the `ns_id` key:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = { ns_id = 1, fg = "${light_gray}" }
  }
})
```

### Configuring styles

> [!NOTE]
> For a list of available styles, please refer to the [Neovim documentation](https://neovim.io/doc/user/api.html#nvim_set_hl())

Styles can be applied to highlight groups:

```lua
require("onedarkpro").setup({
  highlights = {
    Comment = { italic = true },
    Directory = { bold = true },
    ErrorMsg = { italic = true, bold = true }
  }
})
```

Within the theme, collections of highlight groups have been grouped together into `styles`. For users who use monospaced fonts with nice italics, this can go someway to enhancing the aesthetic of a theme with minimal effort. These styles may be configured as shown in the example below:

```lua
require("onedarkpro").setup({
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "italic",
    keywords = "bold,italic",
    constants = "NONE",
    functions = "italic",
    operators = "NONE",
    variables = "NONE",
    parameters = "NONE",
    conditionals = "italic",
    virtual_text = "NONE",
  }
})
```

### Configuring filetype highlighting

> [!NOTE]
> Please see the [Contributing](https://github.com/olimorris/onedarkpro.nvim/blob/main/CONTRIBUTING.md) guide if you would like add support for new filetypes.

The theme supports opinionated highlighting for filetypes, just like the original Visual Studio Code theme. By default, all of the filetypes supported are loaded at runtime. The theme currently has support for:

- `comment`
- `go`
- `html`
- `java`
- `javascript`
- `json`
- `lua`
- `markdown`
- `php`
- `python`
- `ruby`
- `rust`
- `scss`
- `toml`
- `typescript`
- `typescriptreact`
- `vue`
- `xml`
- `yaml`


Specific filetypes can be disabled as follows:

```lua
require("onedarkpro").setup({
  filetypes = {
    markdown = false,
    ruby = false,
  }
})
```

Alternatively, all of the filetypes can be disabled:

```lua
require("onedarkpro").setup({
  filetypes = {
    all = false
  }
})
```

Or, all of the filetypes can be disabled with a select few enabled:

```lua
require("onedarkpro").setup({
  filetypes = {
    all = false,
    markdown = true,
    ruby = true,
  }
})
```

**Adding or modifying filetype highlights**

It's likely that you'll wish to add additional filetype highlights or even change the defaults. This can be achieved by adding them as custom highlight groups in the theme:

```lua
require("onedarkpro").setup({
  highlights = {
    ["@field.yaml"] = { fg = "${blue}", italic = true }
  }
})
```

In the example above, we have set the `field` tree-sitter highlight group to be blue, but only when the filetype is `yaml`. More information can be found via `:h treesitter-highlight-groups`.

To determine which highlight group is being applied in Neovim, see the [FAQ](#question-faqs) section.

**Configuring LSP semantic tokens**

> [!NOTE]
> Semantic tokens are only available in Neovim 0.9+ and with selected LSP servers.

In Neovim, some LSP servers may send tokens to the editor to allow for more intelligent highlighting such as variable scope; a feature which is impossible with tree-sitter alone.

Semantic highlighting in Neovim sees highlight groups set which have a priority greater than those of tree-sitter and the base vim highlight groups (see `:h lsp-semantic_tokens` for more information). A full list of available semantic tokens can be found [here](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens).

The colorscheme has defined _some_ semantic tokens (to match the Visual Studio Code theme as closely as possible) and applies them as part of the filetype highlighting. To determine what tokens are available to set or override, use the `:Inspect` command.

Finally, the colorscheme has defined some non-filetype tokens as a plugin, named `lsp_semantic_tokens`. See the section below for how to disable this.

### Configuring plugins

> [!NOTE]
> Please see the [Contributing](https://github.com/olimorris/onedarkpro.nvim/blob/main/CONTRIBUTING.md) guide if you would like add support for new plugins.

By default, all of the plugins supported by the theme are loaded at runtime. Specific plugins can be disabled as follows:

```lua
require("onedarkpro").setup({
  plugins = {
    nvim_lsp = false,
    polygot = false,
    treesitter = false
  }
})
```

Alternatively, all of the plugins can be disabled:

```lua
require("onedarkpro").setup({
  plugins = {
    all = false
  }
})
```

Or, all of the plugins can be disabled with a select few enabled:

```lua
require("onedarkpro").setup({
  plugins = {
    all = false,
    nvim_lsp = true,
    treesitter = true
  }
})
```

### Configuring options

**Cursorline**

Cursorline highlighting is supported in the theme using a `cursorline` color (which may of course be overridden). This can be enabled with the following:

```lua
require("onedarkpro").setup({
  colors = {
    cursorline = "#FF0000" -- This is optional. The default cursorline color is based on the background
  },
  options = {
    cursorline = true
  }
})
```

**Transparency**

The theme supports transparent backgrounds:

```lua
require("onedarkpro").setup({
  options = {
    transparency = true
  }
})
```

By setting the transparency option to true, the `Normal`, `Folded`, `SignColumn`, `Statusline` and `Tabline` groups will have `NONE` as the background color. Additional transparency may be achieved by overriding more highlight groups.

**Terminal Colors**

By default, the colorscheme changes the colors for Neovim's `:terminal` to the current theme. This can be turned off if required.

```lua
require("onedarkpro").setup({
  options = {
    terminal_colors = false
  }
})
```

**Highlighting Inactive Windows**

The theme supports changing the color of the main window in Neovim when the focus is lost. For example, when a `telescope` or `packer` pop up appears:

```lua
require("onedarkpro").setup({
  options = {
    highlight_inactive_windows = true
  }
})
```

### Configuring additional themes

Users can define their own themes by creating a local file and referencing it in their configuration:

```lua
-- Your configuration
require("onedarkpro").setup({
  themes = {
    vaporwave = "~/.config/nvim/lua/plugins/colors/vaporwave.lua",
  },
})
vim.cmd([[colorscheme vaporwave]])

-- ~/.config/nvim/colors/vaporwave.lua
require("onedarkpro.config").set_theme("vaporwave")
require("onedarkpro").load()

```

In the example above, we've setup our custom theme in our configuration and pointed it to a file which implements the required colors. Please see the [existing themes](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/onedarkpro/themes) in the plugin for the correct structure. We've then created another file in the `colors` directory of our config which points to the onedarkpro setup.

## :rainbow: Helpers

The theme comes with a set of helpers which enable you to interact with and modify colors. The helper file can be accessed via `require("onedarkpro.helpers")`.

**Using colors from a theme**

It can be useful to access a theme's colors for use within other plugins (such as your statusline) after its loaded. For this, the `get_colors` helper can be used:

```lua
local color = require("onedarkpro.helpers")

local colors = color.get_colors()
print(colors.purple) -- #c678dd (if using the Onedark theme)
```

Without specifying a theme name, the helper will get the colors for the currently loaded theme. Alternatively, specify a theme name, such as `get_colors("onelight")`.

You can also use the command `:OnedarkproColors` to open a scratch buffer with the colors from the currently loaded theme. This then allows a colorizer plugin to highlight the colors.

> [!NOTE]
> Please ensure that the colorscheme loads ahead of any plugins which may wish to use the theme's colors.

**Using colors _before_ a theme loads**

Whilst the `get_colors` method is useful in most cases, it may be necessary to get a theme's colors before it has fully loaded. The common use case is for creating custom colors which are based on the theme's own palette and incorporating them back into the theme. For this, the `get_preloaded_colors` method can be used:

```lua
local color = require("onedarkpro.helpers")

local colors = color.get_preloaded_colors()
print(colors.purple) -- #c678dd (if using the Onedark theme)
```

> [!NOTE]
> This will only output the theme's core color palette and not any generated colors.

**Darken/Lighten/Brighten colors**

The theme also contain helpers `darken`, `lighten` and `brighten`, to allow you to modify custom colors or the theme's own. All three helpers follow the same format and take three parameters:

- color (string) - The name of the color to load (if specifying a theme) or a hex value
- amount (number) - The amount to darken/lighten/brighten the color by (range from -100 to 100)
- theme (string) (optional) - The name of the theme to load a color from

To use this in practice:

```lua
local color = require("onedarkpro.helpers")

-- Load the red color from the onedark theme and lighten it by an amount of 7
print(color.lighten("red", 7, "onedark")) -- #e68991
```

Alternatively:

```lua
local color = require("onedarkpro.helpers")

-- Darken Red1 by an amount of 10
print(color.darken("#FF0000", 10)) -- #cc0000
```

A common use case is to modify colors and incorporate them into theme. There are a number of ways to accomplish this and the most efficient is to pass a function (as a string) to the `colors` table in the theme's configuration:

```lua
require("onedarkpro").setup({
  colors = {
    dark_red = "require('onedarkpro.helpers').darken('red', 10, 'onedark')",
  },
  highlights = {
    CustomRedHighlight = {
      fg = "${dark_red}",
    },
  }
})
```

This prevents the theme from trying to resolve the color before the whole of the configuration has been parsed. This also ensures that the startup time for the theme remains small.

## :electric_plug: Supported Plugins

The theme supports the following plugins:

- [aerial.nvim](https://github.com/stevearc/aerial.nvim) (`aerial`)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim) (`barbar`)
- [blink.cmp](https://github.com/saghen/blink.cmp) (`blink_cmp`)
- [CodeCompanion.nvim](https://github.com/olimorris/codecompanion.nvim) (`codecompanion`)
- [Copilot.vim](https://github.com/github/copilot.vim) (`copilot`)
- [csvview.nvim](https://github.com/hat0uma/csvview.nvim) (`csvview`)
- [Dashboard](https://github.com/glepnir/dashboard-nvim) (`dashboard`)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) (`diffview`)
- [flash.nvim](https://github.com/folke/flash.nvim) (`flash.nvim`)
- [gitgraph.nvim](https://github.com/isakbm/gitgraph.nvim) (`gitgraph.nvim`)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) (`gitsigns`)
- [Hop.nvim](https://github.com/phaazon/hop.nvim) (`hop`)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) (`indentline`)
- [leap.nvim](https://github.com/ggandor/leap.nvim) (`leap`)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) (`lsp_saga`)
- LSP Semantic tokens (`lsp_semantic_tokens`)
- [marks.nvim](https://github.com/chentau/marks.nvim) (`marks`)
- [mason.nvim](https://github.com/williamboman/mason.nvim) (`mason`)
- [mcphub.nvim](https://github.com/ravitemer/mcphub.nvim) (`mcphub`)
- [mini.diff](https://github.com/echasnovski/mini.diff) (`mini_diff`)
- [mini.icons](https://github.com/echasnovski/mini.icons) (`mini_icons`)
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope) (`mini_indentscope`)
- [mini.test](https://github.com/echasnovski/mini.test) (`mini_test`)
- [Neotest](https://github.com/nvim-neotest/neotest) (`neotest`)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) (`neo_tree`)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (`nvim_cmp`)
- [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf) (`nvim_bqf`)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) (`nvim_dap`)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) (`nvim_dap_ui`)
- [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) (`nvim_hlslens`)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) (`nvim_lsp`)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic) (`nvim_navic`)
- [nvim-notify](https://github.com/rcarriga/nvim-notify) (`nvim_notify`)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) (`nvim_tree`)
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow) (`nvim_ts_rainbow`)
- [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2) (`nvim_ts_rainbow2`)
- [op.nvim](https://github.com/mrjones2014/op.nvim) (`op_nvim`)
- [packer.nvim](https://github.com/wbthomason/packer.nvim) (`packer`)
- [persisted.nvim](https://github.com/olimorris/persisted.nvim) (`persisted`)
- [polygot](https://github.com/sheerun/vim-polyglot) (`polygot`)
- [startify](https://github.com/mhinz/vim-startify) (`startify`)
- [snacks.nvim](https://github.com/folke/snacks.nvim) (`snacks`)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (`telescope`)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) (`toggleterm`)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`treesitter`)
- [Trouble](https://github.com/folke/trouble.nvim) (`trouble`)
- [Vim Ultest](https://github.com/rcarriga/vim-ultest) (`vim_ultest`)
- [Which Key](https://github.com/folke/which-key.nvim) (`which_key`)
- [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) (`vim_dadbod_ui`)

## :gift: Extras

**Color Configs**

The theme comes with the colors for Alacritty, Kitty, Foot, Wezterm, Rio, Windows Terminal and Zellij and these can be found in the [extras](https://github.com/olimorris/onedarkpro.nvim/tree/main/extras) folder. To use them, refer to their respective documentation.

**Lualine**

The theme has Lualine support out of the box for all of its themes. This can be found in the [Lualine folder](https://github.com/olimorris/onedarkpro.nvim/tree/main/lua/lualine/themes).

**Toggling between themes**

To enable the easy switching between dark and light colorschemes, the following helper function could be used:

```lua
function ToggleTheme()
  if vim.o.background == "dark" then
    vim.cmd("colorscheme onelight")
  else
    vim.cmd("colorscheme onedark")
  end
end
```

## :question: FAQs

**I want to change a highlight group but I don't know what it is. How do I find out?**

If you're using Neovim 0.9+, the `:Inspect` command is available.

If you're on an earlier version of Neovim and are using Tree-sitter, install [Playground](https://github.com/nvim-treesitter/playground) as this gives you access to the powerful `:TSHighlightCapturesUnderCursor` command. This shows any Tree-sitter or syntax highlight groups under the cursor.

**I think the theme would look better if we changed the highlight group of X. Would you accept a PR?**

As mentioned at the top of this readme, the theme is based on the [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) theme for Visual Studio Code. Where possible, I will always reconcile back to that. Unless something looks terrible or the readability can be signficantly improved, I'll nearly always default to what the original theme has done. Remember that you can apply your own customisations to the theme by [configuring highlight groups](#configuring-highlight-groups).

**Ok then, but I've noticed some differences between the theme and the original Visual Studio Code theme. Why is this?**

I've tried to ensure that the theme resembles the original Visual Studio Code theme as much as possible. To that end we have carefully applied custom Tree-sitter queries to certain filetypes as well as mapped LSP semantic token colors. If you notice any differences, please raise a [discussion](https://github.com/olimorris/onedarkpro.nvim/discussions/new?category=color-match) with supporting screenshots.

## :clap: Credits

The following colorschemes serve as inspiration:

- [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) - The inspiration for this colorscheme
- [Catppuccin/nvim](https://github.com/catppuccin/nvim) - For the genius idea of hashing and caching and pushing the envelope of Neovim colorschemes and the kind PRs
- [Nightfox](https://github.com/EdenEast/nightfox.nvim) - For the original code structure
- [GitHub nvim theme](https://github.com/projekt0n/github-nvim-theme) - For the logo inspiration
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - For the tmux theme design
