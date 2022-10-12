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
