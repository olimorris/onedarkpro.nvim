# Contributing

Pull requests to add [new plugins](#adding-new-plugins) or to update highlight groups are welcome.

## Guidelines

The following is a set of guidelines for contributing to this project:

- Format code using [stylua](https://github.com/johnnymorganz/stylua) to keep the formatting consistent
  - Make sure that the project's `stylua.toml` file is used for stylua settings
- Run `make test` prior to submitting a pull request to ensure the tests are passing
  - If you're adding functionality, please ensure you have written [plenary](https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md) tests for it

## Recommendations

- If you're adding new functionality, it may be worth opening an issue to discuss the design of the new feature
  - Also consider how the end user will consume your new feature. It's often easier to start with the API and work backwards
- Consider the use of [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) to make your commit messages more descriptive

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
- Highlight groups can be added with:
```lua
TelescopeSelection = {
    bg = theme.palette.bg,
    fg = theme.palette.purple,
}
```
> See `lua/onedarkpro/themes/onedark.lua` for the list of available colors
- To incorporate styles from a user's config:
```lua
local config = require("onedarkpro.config").config
return {
    AerialClass = {
        fg = theme.palette.purple,
        style = config.options.bold_italic,
    }
}
```
> Reference the `editor.lua` and `syntax.lua` files to see how to add highlight groups and styles from a user's config
- In `lua/onedarkpro/config.lua`, add the plugin to the `plugins` table and set it to `true` by default
  - The name of the plugin should be its filename without the `.lua` extension
- Update the `README.md` file to include the new plugin and link to its official repository
- Finally, create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
