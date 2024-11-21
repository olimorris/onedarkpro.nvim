# Contributing

- [Guidelines](#guidelines)
- [Adding new extras](#adding-new-extras)
- [Adding new filetypes](#adding-new-filetypes)
- [Adding new plugins](#adding-new-plugins)

By default, the theme aims to stay true to the original [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) theme (_"the original"_). Any new functionality, colors or design decisions will always be reconciled back to the original. If you notice any discrepencies, please submit a PR.

## Guidelines

The following is a set of guidelines for contributing to this project:

- When highlighting discrepencies between the theme and the original, please include screenshots and your settings in both Neovim and Visual Studio Code
- When adding any new highlight groups (which are not plugin related), please include screenshots for both Neovim and Visual Studio Code
- Format your code using [stylua](https://github.com/johnnymorganz/stylua) to keep the formatting consistent
- Make sure that the project's `stylua.toml` file is used for stylua settings
- Run `make all` prior to submitting a pull request to ensure the tests are passing
- If you're adding functionality, please ensure you have written [plenary](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) tests for it

### Recommendations

- If you're adding new functionality, please open an issue to discuss the design of the new feature
- Also consider how the end user will consume your new feature. It's often easier to start with the API and work backwards
- Consider the use of [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) to make your commit messages more descriptive
- Finally, a [.lazy.lua](https://github.com/olimorris/onedarkpro.nvim/blob/main/.lazy.lua) file has been added to the theme, which allows you to see the realtime impact of your editing. You'll be prompted to load the file when you clone the repository

## Adding new extras

Making the theme's colors accessible to other applications helps to create a unified development setup for users. As of `v2.0.0`, the theme makes it much easier to add support for new applications:

1. Fork the repository
2. Add your new application to `lua/onedarkpro/extra/new_app.lua`
3. Ensure it returns a module with a `template` string which contains all of the colors required for your new application. Take inspiration from the pre-existing ones we've created
4. Add your new app to `lua/onedarkpro/extra/init.lua`, specifying the label and the required filetype of the output
5. Then run `make extra` from the cmdline
6. Make a PR

## Adding new filetypes

Filetype highlights are the feature that allows a colorscheme to get as close to the original as possible, thanks to Treesitter and support for LSP semantic tokens.

When adding new filetypes, they must stay as close to the original Visual Studio Code theme as possible. Even with the inclusion of opinionated styles (such as bolds and italics).

### Initial setup

- Firstly, create a code snippet in the language you're adding support for and load it in Visual Studio Code and Neovim
- For the colorscheme, save the snippet in the `examples` dir. E.g. `examples/typescript.ts`
- Ensure that the following settings in Visual Studio Code are enabled:

<img src="https://user-images.githubusercontent.com/9512444/196125493-e4a84477-6396-49c5-b1a9-6c5c548458c0.png" alt="vscode settings" />

- Ensure that your Neovim version is 0.9+

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

- Comparing the code snippet in Neovim and Visual Studio Code, you can use the `:Inspect` command from within Neovim to determine which highlight group is being applied:

<img src="https://user-images.githubusercontent.com/9512444/224000509-27b5a5c3-6f82-437b-8915-70cab224ede0.png" alt="Inspect output" />

- Highlight groups may then be added with the highlight name from the output (with an `@` symbol), followed by the filetype:

```lua
return {
    ["@property.typescript"] = { fg = theme.palette.red },
}
```

- The colorscheme enables users to be able to [apply styles](https://github.com/olimorris/onedarkpro.nvim#configuring-styles) to match enable a closer match to Visual Studio Code, whilst still enabling the user to apply customisations:

```lua
local config = require("onedarkpro.config")

return {
    ["@method.call.typescript"] = { fg = theme.palette.blue, style = config.styles.methods },
}
```

- For highlight groups that do not have any styling in Visual Studio Code, you should allow for the user to apply their own custom styles (as per the [README](https://github.com/olimorris/onedarkpro.nvim#configuring-styles))
- This would fallback to `style = config.styles.methods` for a highlight group such as `["@method.call.typescript]`

### Final configuration

- To ensure the filetype is loaded by default, go to `lua/onedarkpro/config.lua` and add the filetype to the `filetypes` table and set it to `true` by default:

```lua
filetypes = {
    markdown = true,
    python = true,
    -- ...
    typescript = true,
},
```

> **Note**: The name of the filetype should be its filename without the `.lua` extension

- Update the `README.md` file to list the new filetype. Please follow the existing format
- Finally, create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) and be sure to include a screenshot of the language in both Visual Studio Code and Neovim (after your modifications)

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
local config = require("onedarkpro.config")

return {
    AerialClass = {
        fg = theme.palette.purple,
        style = config.styles.keywords,
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

> **Note**: The name of the plugin should be its filename without the `.lua` extension

- Update the `README.md` file to include the new plugin; This should include the `Default Configuration` and `Supported Plugins` sections
- Finally, create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
