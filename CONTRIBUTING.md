# Contributing

- [Guidelines](#guidelines)
- [Adding new filetypes](#adding-new-filetypes)
- [Adding new plugins](#adding-new-plugins)

By default, the theme aims to stay true to the original [One Dark Pro](https://github.com/Binaryify/OneDark-Pro)
theme (_"the original"_) as much as possible. If you notice any discrepencies, please make a pull request.

## Guidelines

The following is a set of guidelines for contributing to this project:

- When highlighting discrepencies between the theme and the original, please include screenshots and your settings in both Neovim and VS Code
- Format code using [stylua](https://github.com/johnnymorganz/stylua) to keep the formatting consistent
- Make sure that the project's `stylua.toml` file is used for stylua settings
- Run `make test` prior to submitting a pull request to ensure the tests are passing
- If you're adding functionality, please ensure you have written [plenary](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) tests for it

### Recommendations

- If you're adding new functionality, please open an issue to discuss the design of the new feature
- Also consider how the end user will consume your new feature. It's often easier to start with the API and work backwards
- Consider the use of [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) to make your commit messages more descriptive

## Adding new filetypes
Filetype highlights are the feature that allows a colorscheme to get as close to the original as possible, thanks to Treesitter.

When adding new filetypes, they must stay as close to the original VS Code theme as possible. Even with the inclusion of opinionated styles (such as bolds and italics).

### Initial setup

- Firstly, create a code snippet in the language you're adding support for and load it in VS Code and Neovim
- For the colorscheme, save the snippet in the `examples` dir. E.g. `examples/ruby.rb`
- Ensure that the following settings in VS Code are enabled:

<img src="https://user-images.githubusercontent.com/9512444/196125493-e4a84477-6396-49c5-b1a9-6c5c548458c0.png" alt="vscode settings" />

- Ensure that you have installed the [Neovim Treesitter Playground](https://github.com/nvim-treesitter/playground)

### Adding highlights

- Create the new filetype file in the `lua/onedarkpro/highlights/filetypes/` dir
- The filetype should implement the following interface:

```lua
local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    return {
    -- Add your filetype highlight groups here
    }
end

return M
```

- Comparing the code snippet in Neovim and VS Code, you can use the `:TSHighlightCapturesUnderCursor` command from the Treesitter Playground to determine which highlight group is responsible for highlighting certain text:

<img src="https://user-images.githubusercontent.com/9512444/196629898-ce690157-99f5-4540-bdfa-e28ac3d5e012.png" alt="Playground output" />

- Highlight groups may then be added with the highlight name from Playground (with an `@` symbol), followed by the filetype:

```lua
return {
    ["@function.ruby"] = { fg = theme.palette.blue },
}
```

- The colorscheme enables users to be able to customise styles to highlight groups such as `functions`, `variables` and `keywords` (as per the [README](https://github.com/olimorris/onedarkpro.nvim#configuring-styles)). This allows users to match to the styles from VS Code whilst still enabling customisations:

```lua
local config = require("onedarkpro.config").config

return {
    ["@function.ruby"] = { fg = theme.palette.blue, style = config.styles.functions },
}
```

- For highlight groups that do not have any styling in VS Code, you should allow for the user to apply their own custom styles
- This would fallback to `style = config.styles.functions` for a highlight group such as `["@function.ruby]`

### Final configuration

- To ensure the filetype is loaded by default, go to `lua/onedarkpro/config.lua` and add the filetype to the `filetypes` table and set it to `true` by default:

```lua
filetypes = {
    markdown = true,
    python = true,
    -- ...
    ruby = true,
},
```
> **Note:** The name of the filetype should be its filename without the `.lua` extension

- Update the `README.md` file to list the new filetype. Please follow the existing format
- Finally, create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) and be sure to include a screenshot of the language in both VS Code and Neovim (after your modifications)

## Adding new plugins

It can be difficult to keep track of all of the amazing new plugins which enter the Neovim ecosystem. To add support for a new plugin in the theme:

- Create the plugin file in `lua/onedarkpro/highlights/plugins/`
- The plugin should implement the following interface:
```lua
local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    return {
    -- Add your highlight groups here
    }
end

return M
```
- Highlight groups can be added like so:
```lua
TelescopeSelection = {
    bg = theme.palette.bg,
    fg = theme.palette.purple,
}
```
> See `lua/onedarkpro/themes/onedark.lua` for the list of available colors in the colorschemes

- To incorporate styles from a user's config:

```lua
local config = require("onedarkpro.config").config

return {
    AerialClass = {
        fg = theme.palette.purple,
        style = "bold,italic"
    }
}
```
> Reference the `editor.lua` and `syntax.lua` files to see how to add highlight groups and styles from a user's config

- To load the plugin by default, go to `lua/onedarkpro/config.lua` and add the plugin to the `plugins` table and set it to `true` by default:

```lua
plugins = {
    aerial = true,
    barbar = true,
    -- ...
    my_new_plugin = true,
},
```
> **Note:** The name of the plugin should be its filename without the `.lua` extension

- Update the `README.md` file to include the new plugin. Please follow the existing format
- Finally, create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
