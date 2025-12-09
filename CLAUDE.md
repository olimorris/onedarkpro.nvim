# OneDarkPro.nvim

Atom's iconic One Dark theme for Neovim. Fully customizable, with Tree-sitter, LSP semantic tokens, and support for many common plugins.

## Project Overview

OneDarkPro.nvim is a highly customizable Neovim colorscheme plugin that implements the One Dark Pro theme from Visual Studio Code. It provides:

- 5 theme variants: onedark, onelight, onedark_vivid, onedark_dark, vaporwave
- Automatic caching for faster load times
- Full Tree-sitter and LSP semantic token support
- Extensive plugin integration (40+ plugins supported)
- Filetype-specific highlighting
- Color helper utilities for theme customization
- Terminal color exports for Alacritty, Kitty, Foot, Wezterm, Rio, Windows Terminal, and Zellij

## Architecture

### Directory Structure

```
.
├── lua/onedarkpro/          # Core plugin code
│   ├── themes/              # Theme definitions (onedark.lua, onelight.lua, etc.)
│   ├── highlights/          # Highlight group definitions
│   │   ├── filetypes/       # Language-specific highlights
│   │   ├── plugins/         # Plugin-specific highlights
│   │   ├── editor.lua       # Core editor highlights
│   │   └── syntax.lua       # Base syntax highlights
│   ├── lib/                 # Core libraries
│   │   ├── compile.lua      # Theme compilation engine
│   │   ├── cache.lua        # Cache management
│   │   ├── color.lua        # Color manipulation utilities
│   │   └── palette.lua      # Color palette management
│   ├── extra/               # Terminal color exporters
│   ├── config.lua           # Configuration management
│   ├── init.lua             # Plugin entry point
│   ├── helpers.lua          # Public helper API
│   └── utils/               # Internal utilities
├── colors/                  # Vim colorscheme files
├── after/queries/           # Custom Tree-sitter queries
├── extras/                  # Generated terminal configs
├── plugin/                  # Plugin runtime files
└── tests/                   # Test suite
```

### Key Components

#### 1. Theme System (`lua/onedarkpro/themes/`)
- Each theme file (e.g., `onedark.lua`) defines a color palette
- Themes inherit from a base palette structure
- Colors can be overridden per theme

#### 2. Compilation System (`lua/onedarkpro/lib/compile.lua`)
- Compiles theme configurations into cached highlight commands
- Generates optimized Lua files for faster loading
- Hash-based cache invalidation

#### 3. Highlight System (`lua/onedarkpro/highlights/`)
- Modular highlight group definitions
- Separated by concern: editor, syntax, filetypes, plugins
- Conditional loading based on user configuration

#### 4. Configuration (`lua/onedarkpro/config.lua`)
- Manages user settings and defaults
- Validates and normalizes configuration
- Handles theme selection and plugin/filetype toggles

#### 5. Color Helpers (`lua/onedarkpro/helpers.lua`)
- Public API for color manipulation
- `get_colors()` - retrieve theme colors
- `get_preloaded_colors()` - get colors before theme loads
- `darken()`, `lighten()`, `brighten()` - color modification

## Key Files

### Core Files
- `lua/onedarkpro/init.lua` - Main entry point with `setup()` and `load()` functions
- `lua/onedarkpro/config.lua` - Configuration management and defaults
- `lua/onedarkpro/lib/compile.lua` - Theme compilation and generation
- `lua/onedarkpro/lib/cache.lua` - Cache management system

### Theme Files
- `lua/onedarkpro/themes/onedark.lua` - Default dark theme
- `lua/onedarkpro/themes/onelight.lua` - Light theme
- `lua/onedarkpro/themes/onedark_vivid.lua` - Vivid variant
- `lua/onedarkpro/themes/onedark_dark.lua` - Darker variant
- `lua/onedarkpro/themes/vaporwave.lua` - Vaporwave theme

### Highlight Files
- `lua/onedarkpro/highlights/editor.lua` - Core editor UI highlights
- `lua/onedarkpro/highlights/syntax.lua` - Base syntax highlighting
- `lua/onedarkpro/highlights/filetype.lua` - Filetype highlight loader
- `lua/onedarkpro/highlights/plugin.lua` - Plugin highlight loader

## Development Workflow

### Adding a New Theme
1. Create a new file in `lua/onedarkpro/themes/`
2. Define the color palette following the structure in existing themes
3. Add the theme to `defaults.themes` in `lua/onedarkpro/config.lua`
4. Create a colorscheme file in `colors/` directory

### Adding Plugin Support
1. Create a new file in `lua/onedarkpro/highlights/plugins/`
2. Define highlight groups for the plugin
3. Add the plugin to `defaults.plugins` in `lua/onedarkpro/config.lua`
4. Use existing plugins as templates

### Adding Filetype Support
1. Create a new file in `lua/onedarkpro/highlights/filetypes/`
2. Define Tree-sitter and LSP semantic token highlights
3. Add the filetype to `defaults.filetypes` in `lua/onedarkpro/config.lua`
4. Consider adding custom Tree-sitter queries in `after/queries/`

### Testing
- Tests are located in `tests/` directory
- Uses plenary.nvim for testing
- Run tests to verify changes don't break existing functionality

### Generating Extras
- Terminal color configs are generated from themes
- Files in `lua/onedarkpro/extra/` are exporters
- Run `:OneDarkProExtras` to generate configs in `extras/` directory

## Configuration System

### User Configuration Flow
1. User calls `require("onedarkpro").setup(opts)` in their config
2. Options are merged with defaults in `config.lua`
3. Configuration is hashed for cache invalidation
4. Theme is compiled or loaded from cache

### Cache System
- Cache stored in `vim.fn.stdpath("cache")/onedarkpro/`
- Files named `{theme}_compiled.lua`
- Hash file tracks configuration changes
- Automatic cache regeneration when config changes

### Color Resolution
Colors support multiple formats:
- Hex colors: `#FF0000`
- Theme color references: `${red}`
- Dynamic evaluation: `require('onedarkpro.helpers').darken('red', 10, 'onedark')`

### Highlight Group Overrides
Highlights can be customized by:
- Theme: `{ onedark = { fg = "${yellow}" } }`
- Background: `{ dark = { fg = "${yellow}" }, light = { fg = "${red}" } }`
- Direct: `{ fg = "#FF0000", italic = true }`
- Linking: `{ link = "Substitute" }`
- Extending: `{ underline = true, extend = true }`

## Important Notes

### Color Matching
- Theme aims to match One Dark Pro for VSCode
- Tree-sitter queries customized for accurate highlighting
- LSP semantic tokens configured to match VSCode behavior
- PRs should maintain consistency with original theme

### Performance
- Caching is critical for performance (enabled by default)
- Themes are compiled to pure highlight commands
- Avoid runtime color calculations
- Cache invalidation based on config hash and git state

### Compatibility
- Requires Neovim 0.9.2+
- Requires `termguicolors` enabled
- Tree-sitter required for full syntax highlighting
- LSP semantic tokens require 0.9+ and compatible server

## Common Tasks

### Changing a Highlight Group
1. Locate the highlight group definition (use `:Inspect` in Neovim)
2. Override in user config or modify source file
3. Clear cache with `:OneDarkProClean` if needed
4. Reload colorscheme

### Adding a New Color
1. Add to theme file in `lua/onedarkpro/themes/`
2. Reference in highlight groups with `${color_name}`
3. Available immediately in custom highlights

### Debugging
- Enable debug mode: `require("onedarkpro").setup({ debug = true })`
- Check cache files for compiled output
- Use `:OneDarkProColors` to inspect current palette

## Commands
- `:OneDarkProCache` - Force regenerate cache files
- `:OneDarkProClean` - Remove cache files
- `:OneDarkProColors` - Display current theme colors
- `:OneDarkProExtras` - Generate terminal configs (use `make extra` to generate for the theme's extras folder)

## External Resources
- [One Dark Pro VSCode Theme](https://github.com/Binaryify/OneDark-Pro)
- [Tree-sitter Documentation](https://tree-sitter.github.io/tree-sitter/)
- [LSP Semantic Tokens](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens)
