local M = {}

---Set the highlight groups for the new treesitter groups
---@param theme table
---@return table
local function treesitter_new(theme, config)
    return {
        ["@annotation"] = { fg = theme.palette.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        ["@attribute"] = { fg = theme.palette.purple }, -- (unstable)
        ["@boolean"] = { link = "Boolean" }, -- For booleans.
        ["@character"] = { link = "Character" }, -- For characters.
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
        ["@function.builtin"] = { fg = theme.palette.yellow }, -- For builtin functions: `table.insert` in Lua.
        ["@function.macro"] = { fg = theme.palette.blue }, -- For macro defined functions (calls and definitions): each `macro_rules` in Rust.
        ["@include"] = { fg = theme.palette.purple }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        ["@keyword"] = { fg = theme.palette.purple, style = config.styles.keywords }, -- For keywords that don't fall in previous categories.
        ["@keyword.function"] = { fg = theme.palette.purple, style = config.styles.keywords }, -- For keywords used to define a function.
        ["@keyword.operator"] = { fg = theme.palette.purple }, -- For operators that are English words, e.g. `and`, `as`, `or`.
        ["@keyword.return"] = { link = "@keyword" }, -- for the `return` and `yield` keywords.
        ["@label"] = { fg = theme.palette.purple }, -- For labels: `label:` in C and `:label:` in Lua.
        ["@method"] = { fg = theme.palette.blue }, -- For method calls and definitions.
        ["@namespace"] = { fg = theme.palette.yellow }, -- For identifiers referring to modules and namespaces.
        ["@number"] = { fg = theme.palette.orange, style = config.styles.numbers }, -- Numeric literals that don't fit into other categories.
        ["@operator"] = { fg = theme.palette.cyan, style = config.styles.operators }, -- For any operator: `+`, but also `->` and `*` in theme.config.
        ["@parameter"] = { fg = theme.palette.red }, -- For parameters of a function.
        ["@parameter.reference"] = { fg = theme.palette.red }, -- For references to parameters of a function.
        ["@property"] = { fg = theme.palette.red }, -- Same as `TSField`.
        ["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters ie: `.`
        ["@punctuation.bracket"] = { fg = theme.palette.fg }, -- For brackets and parens.
        ["@punctuation.special"] = { fg = theme.palette.fg }, -- For special punctutation that does not fall in the categories before.
        ["@repeat"] = { fg = theme.palette.purple }, -- For keywords related to loops.
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

---Set the highlight groups for the old, `TS*` style treesitter groups
---@param theme table
---@return table
local function treesitter_old(theme, config)
    return {
        TSAnnotation = { fg = theme.palette.red },
        TSAttribute = { fg = theme.palette.purple },
        TSBoolean = { link = "Boolean" },
        TSCharacter = { link = "Character" },
        TSComment = { link = "Comment" },
        TSConditional = { fg = theme.palette.purple, style = config.styles.conditionals },
        TSConstant = { fg = theme.palette.orange, style = config.styles.constants },
        TSConstBuiltin = { fg = theme.palette.purple, style = config.styles.constants },
        TSConstMacro = { link = "TSConstant" },
        TSConstructor = { fg = theme.palette.yellow },
        TSError = { link = "Error" },
        TSException = { link = "Exception" },
        TSField = { fg = theme.palette.fg },
        TSFloat = { link = "Float" },
        TSFunction = { fg = theme.palette.blue, style = config.styles.functions },
        TSFuncBuiltin = { fg = theme.palette.yellow },
        TSFuncMacro = { fg = theme.palette.blue },
        TSInclude = { fg = theme.palette.purple },
        TSKeyword = { fg = theme.palette.purple, style = config.styles.keywords },
        TSKeywordFunction = { fg = theme.palette.purple, style = config.styles.keywords },
        TSKeywordOperator = { fg = theme.palette.purple },
        TSKeywordReturn = { link = "TSKeyword" },
        TSLabel = { fg = theme.palette.purple },
        TSMethod = { fg = theme.palette.blue },
        TSNamespace = { fg = theme.palette.yellow },
        TSNumber = { fg = theme.palette.orange, style = config.styles.numbers },
        TSOperator = { fg = theme.palette.cyan, style = config.styles.operators },
        TSParameter = { fg = theme.palette.red },
        TSParameterReference = { fg = theme.palette.red },
        TSProperty = { fg = theme.palette.red },
        TSPunctDelimiter = { link = "Delimiter" },
        TSPunctBracket = { fg = theme.palette.fg },
        TSPunctSpecial = { fg = theme.palette.fg },
        TSRepeat = { fg = theme.palette.purple },
        TSString = { fg = theme.palette.green, style = config.styles.strings },
        TSStringRegex = { fg = theme.palette.green, style = config.styles.strings },
        TSStringEscape = { fg = theme.palette.cyan, style = config.styles.strings },
        TSStringSpecial = { link = "Special" },
        TSSymbol = { fg = theme.palette.red },
        TSTag = { fg = theme.palette.red },
        TSTagAttribute = { link = "TSProperty" },
        TSTagDelimiter = { link = "Delimiter" },
        TSText = { fg = theme.palette.fg },
        TSStrong = { link = "Bold" },
        TSUnderline = { link = "Underlined" },
        TSStrike = { fg = theme.palette.fg },
        TSTitle = { fg = theme.palette.fg },
        TSLiteral = { fg = theme.palette.fg },
        TSURI = { fg = theme.palette.blue },
        TSMath = { fg = theme.palette.fg },
        TSTextReference = { link = "TSText" },
        TSEnvironment = { link = "Macro" },
        TSEnvironmentName = { link = "Type" },
        TSNote = { fg = theme.palette.fg },
        TSWarning = { fg = theme.palette.yellow },
        TSDanger = { fg = theme.palette.red },
        TSType = { fg = theme.palette.yellow, style = config.styles.types },
        TSTypeBuiltin = { fg = theme.palette.yellow, style = config.styles.types },
        TSVariable = { fg = theme.palette.red, style = config.styles.variables },
        TSVariableBuiltin = { fg = theme.palette.yellow },
    }
end

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme, config)
    if require("onedarkpro.utils").has_nvim_08 then
        return treesitter_new(theme, config)
    end

    return treesitter_old(theme, config)
end

return M
