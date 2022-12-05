local M = {}

---Set the highlight groups for the new treesitter groups
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@annotation"] = { fg = theme.palette.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        ["@attribute"] = { fg = theme.palette.purple }, -- (unstable)
        ["@boolean"] = { link = "Boolean" }, -- For booleans.
        ["@character"] = { link = "Character" }, -- For characters.
        ["@character.special"] = { fg = theme.palette.purple }, -- For characters.
        ["@comment"] = { link = "Comment" }, -- For comment blocks.
        ["@conditional"] = { fg = theme.palette.purple, style = config.styles.conditionals }, -- For keywords related to conditionnals.
        ["@constant"] = { fg = theme.palette.orange, style = config.styles.constants }, -- For constants
        ["@constant.builtin"] = { fg = theme.palette.purple, style = config.styles.constants }, -- For constant that are built in the language: `nil` in Lua.
        ["@constant.macro"] = { link = "@constant" }, -- For constants that are defined by macros: `NULL` in theme.config.
        ["@constructor"] = { fg = theme.palette.yellow }, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
        ["@error"] = { link = "Error" }, -- For syntax/parser errors.
        ["@exception"] = { link = "Exception" }, -- For exception related keywords.
        ["@field"] = { fg = theme.palette.fg }, -- For fields (responsible for making YAML files look rubbish!)
        ["@float"] = { link = "Float" }, -- For floats.
        ["@function"] = { fg = theme.palette.blue, style = config.styles.functions }, -- For function (calls and definitions).
        ["@function.call"] = { link = "@function" }, -- For function (calls and definitions).
        ["@function.builtin"] = { fg = theme.palette.yellow }, -- For builtin functions: `table.insert` in Lua.
        ["@function.macro"] = { fg = theme.palette.blue }, -- For macro defined functions (calls and definitions): each `macro_rules` in Rust.
        ["@include"] = { fg = theme.palette.purple }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        ["@keyword"] = { fg = theme.palette.purple, style = config.styles.keywords }, -- For keywords that don't fall in previous categories.
        ["@keyword.function"] = { fg = theme.palette.purple, style = config.styles.keywords }, -- For keywords used to define a function.
        ["@keyword.operator"] = { fg = theme.palette.purple }, -- For operators that are English words, e.g. `and`, `as`, `or`.
        ["@keyword.return"] = { link = "@keyword" }, -- for the `return` and `yield` keywords.
        ["@label"] = { fg = theme.palette.purple }, -- For labels: `label:` in C and `:label:` in Lua.
        ["@method"] = { fg = theme.palette.blue }, -- For method calls and definitions.
        ["@method.call"] = { link = "@method" }, -- For method calls and definitions.
        ["@namespace"] = { fg = theme.palette.yellow }, -- For identifiers referring to modules and namespaces.
        ["@number"] = { fg = theme.palette.orange, style = config.styles.numbers }, -- Numeric literals that don't fit into other categories.
        ["@operator"] = { fg = theme.palette.cyan, style = config.styles.operators }, -- For any operator: `+`, but also `->` and `*` in theme.config.
        ["@parameter"] = { fg = theme.palette.red }, -- For parameters of a function.
        ["@parameter.reference"] = { fg = theme.palette.red }, -- For references to parameters of a function.
        ["@property"] = { fg = theme.palette.red }, -- Same as `TSField`.
        ["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters ie: `.`
        ["@punctuation.bracket"] = { fg = theme.palette.fg }, -- For brackets and parens.
        ["@punctuation.special"] = { fg = theme.palette.fg }, -- For special punctutation that does not fall in the categories before.
        ["@repeat"] = { link = "Repeat" }, -- For keywords related to loops.
        ["@string"] = { fg = theme.palette.green, style = config.styles.strings }, -- For strings.
        ["@string.regex"] = { fg = theme.palette.green, style = config.styles.strings }, -- For regexes.
        ["@string.escape"] = { fg = theme.palette.cyan, style = config.styles.strings }, -- For escape characters within a string.
        ["@string.special"] = { link = "Special" }, -- For strings with special meaning that don't fit into the above categories.
        ["@symbol"] = { fg = theme.palette.red }, -- For identifiers referring to symbols or atoms.
        ["@tag"] = { fg = theme.palette.red }, -- Tags like html tag names.
        ["@tag.attribute"] = { link = "@property" }, -- For html tag attributes.
        ["@tag.delimiter"] = { link = "Delimiter" }, -- Tag delimiter like `<` `>` `/`
        ["@text"] = { fg = theme.palette.fg }, -- For strings considered text in a markup language.
        ["@text.strong"] = { link = "Bold" }, -- For text to be represented with strong.
        -- ["@text.emphasis"] = { }, -- For text to be represented with emphasis.
        ["@text.underline"] = { link = "Underlined" }, -- For text to be represented with an underline.
        ["@text.strike"] = { fg = theme.palette.fg }, -- For strikethrough text.
        ["@text.title"] = { fg = theme.palette.fg }, -- Text that is part of a title.
        ["@text.literal"] = { fg = theme.palette.fg }, -- Literal text.
        ["@text.uri"] = { fg = theme.palette.blue }, -- Any URI like a link or email.
        ["@text.math"] = { fg = theme.palette.fg }, -- For LaTex-like math environments.
        ["@text.reference"] = { link = "@text" }, -- For footnotes, text references, citations.
        ["@text.environment"] = { link = "Macro" }, -- For text environments of markup languages.
        ["@text.environment.name"] = { link = "Type" }, -- For the name/the string indicating the type of text environment.
        ["@text.note"] = { fg = theme.palette.fg }, -- Text representation of an informational note.
        ["@text.warning"] = { fg = theme.palette.yellow }, -- Text representation of a warning note.
        ["@text.danger"] = { fg = theme.palette.red }, -- Text representation of a danger note.
        ["@type"] = { fg = theme.palette.yellow, style = config.styles.types }, -- Type (and class) definitions and annotations.
        ["@type.builtin"] = { fg = theme.palette.yellow, style = config.styles.types }, -- Built-in types: `i32` in Rust.
        ["@variable"] = { fg = theme.palette.red, style = config.styles.variables }, -- Any variable name that does not have another highlight.
        ["@variable.builtin"] = { fg = theme.palette.yellow }, -- Variable names that are defined by the languages, like `this` or `self`.
    }
end

return M
