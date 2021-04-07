# onedark.nvim
My personal One Dark port for Neovim, built on [Lush](https://github.com/rktjmp/lush.nvim)

Contains **dark** and **light** color palettes.

### Dark
![Dark](screenshots/dark.png "Dark")

### Light
![Light](screenshots/light.png "Light")

## Requirements
- Neovim 0.5 or greater
- `termguicolors` enabled for true color support

## Installation
Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'olimorris/onedark.nvim',
    requires = 'rktjmp/lush.nvim'
}
```

## Usage
Add the following to your `init.lua` file to start using the theme:

```lua
vim.o.background = 'dark'
vim.g.colors_name = 'onedark_nvim'
```
> Note: Changing the background to `light` will enable the light version of the theme

### Overriding colors
The theme's color palettes are separated into two; *dark* and *light*. Each palette has 13 colors with the light colors being specified with a `_light` suffix. The full colors can be seen in the `onedark_nvim.lua` file, [here](lua/lush_theme/onedark_nvim.lua).

The colors can be overwritten by specifying an override attribute:

```lua
vim.g.onedark_override = {
      red = "#FF0000",
      red_light = "#e67780"
}
```

### Bolds, italics and underlines
By default, the theme has an opinionated choice on its use of bolds, italics and underlines. You can turn these off by using the following code:

```lua
vim.g.onedark_settings= {
    bold = false,
    italic = false,
    underline = false
}
```

### Theme toggling
You can use the example snippet to toggle between dark and light themes:

```lua
function ThemeToggle()
    if vim.api.nvim_get_option('background') == 'dark' then
        vim.api.nvim_set_option('background', 'light')
    else
        vim.api.nvim_set_option('background', 'dark')
    end
end
```

## License
[MIT](https://github.com/olimorris/onedark.nvim/blob/master/LICENSE.md)
