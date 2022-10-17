# Contributing

- [Adding new filetypes](#adding-new-filetypes)
- [Adding new plugins](#adding-new-plugins)

By default, the theme stays close to the original [One Dark Pro](https://github.com/Binaryify/OneDark-Pro) theme. Therefore, changes to the color palette are unlikely to be accepted.

With the new rewrite, the addition of new themes to the color scheme is much easier and I would be happy to consider them.

### Guidelines

The following is a set of guidelines for contributing to this project:

- Format code using [stylua](https://github.com/johnnymorganz/stylua) to keep the formatting consistent
  - Make sure that the project's `stylua.toml` file is used for stylua settings
- Run `make test` prior to submitting a pull request to ensure the tests are passing
  - If you're adding functionality, please ensure you have written [plenary](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) tests for it

### Recommendations

- If you're adding new functionality, it may be worth opening an issue to discuss the design of the new feature
  - Also consider how the end user will consume your new feature. It's often easier to start with the API and work backwards
- Consider the use of [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) to make your commit messages more descriptive

## Adding new filetypes
New filetypes should stay as close to the original VS Code theme as possible. This means that the opinionated styles (such
as bolds and italics) _must_ be included.

To add new support for filetypes in the colorscheme:

- Create a code snippet in the language you're adding support for and load it in VS Code and Neovim
- Save the snippet in the `examples` dir
- Ensure that the following settings in VS Code are enabled:

<img src="https://user-images.githubusercontent.com/9512444/196125493-e4a84477-6396-49c5-b1a9-6c5c548458c0.png" alt="vscode settings" />

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
- Matching between VS Code and Neovim can be done by adding new highlight groups:
```lua
return {
    ["@function.call.ruby"] = { fg = theme.palette.blue },
}
```
> See the [README](https://github.com/olimorris/onedarkpro.nvim#question-faqs) for information on how to determine which highlight groups should be included
- To match the bold and italics from VS Code, you can incorporate styles:
```lua
local config = require("onedarkpro.config").init()
return {
    ["@function.ruby"] = { fg = theme.palette.blue, style = config.options.bold },
}
```
> Possible options are `bold`, `italic`, `bold_italic`, `undercurl`, `underline`, `none`

- To load the filetype by default, go to `lua/onedarkpro/config.lua` and add the filetype to the `filetypes` table and set it to `true` by default:
```lua
filetypes = {
    markdown = true,
    python = true,
    -- ...
    my_new_filetype = true,
},
```
> **Note:** The name of the filetype should be its filename without the `.lua` extension
- Update the `README.md` file to list the new filetype. Please follow the existing format
- Finally, create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) and be sure to include a screenshot of the language in both VS Code and Neovim (after your modifications)

## Adding new plugins

It can be difficult to keep track of all of the amazing new plugins which enter the Neovim ecosystem. To add support for a new plugin in the colorscheme:

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
> See `lua/onedarkpro/themes/onedark.lua` for the list of available colors in the themes
- To incorporate styles from a user's config:
```lua
local config = require("onedarkpro.config").init()
return {
    AerialClass = {
        fg = theme.palette.purple,
        style = config.options.bold_italic,
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
