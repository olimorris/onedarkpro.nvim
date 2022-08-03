local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        -- https://github.com/nvim-treesitter/nvim-treesitter/blob/fb5d6e04a87863d01a45dab2cbafec4e2a74822b/doc/nvim-treesitter.txt
        TSAnnotation = { fg = theme.palette.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute = { fg = theme.palette.purple }, -- (unstable)
        TSBoolean = { link = "Boolean" }, -- For booleans.
        TSCharacter = { link = "Character" }, -- For characters.
        TSComment = { link = "Comment" }, -- For comment blocks.
        TSConditional = { link = "Conditional" }, -- For keywords related to conditionnals.
        TSConstant = { link = "Constant" }, -- For constants
        TSConstBuiltin = { fg = theme.palette.purple }, -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro = { link = "Constant" }, -- For constants that are defined by macros: `NULL` in theme.config.
        TSConstructor = { fg = theme.palette.yellow }, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
        TSError = { link = "Error" }, -- For syntax/parser errors.
        TSException = { link = "Exception" }, -- For exception related keywords.
        TSField = { fg = theme.palette.fg }, -- For fields (responsible for making YAML files look rubbish!)
        TSFloat = { link = "Float" }, -- For floats.
        TSFunction = {
            fg = theme.palette.blue,
            style = config.styles.functions,
        }, -- For function (calls and definitions).
        TSFuncBuiltin = { fg = theme.palette.yellow }, -- For builtin functions: `table.insert` in Lua.
        TSFuncMacro = { fg = theme.palette.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = { fg = theme.palette.purple, style = config.options.italic }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSKeyword = {
            fg = theme.palette.purple,
            style = config.styles.keywords,
        }, -- For keywords that don't fall in previous categories.
        TSKeywordFunction = {
            fg = theme.palette.purple,
            style = config.styles.keywords,
        }, -- For keywords used to define a fuction.
        TSKeywordOperator = {
            fg = theme.palette.purple,
            style = config.options.italic,
        }, -- For operators that are English words, e.g. `and`, `as`, `or`.
        TSKeywordReturn = { link = "TSKeyword" }, -- for the `return` and `yield` keywords.
        TSLabel = { fg = theme.palette.purple, style = config.options.italic }, -- For labels: `label:` in C and `:label:` in Lua.
        TSMethod = { fg = theme.palette.blue }, -- For method calls and definitions.
        TSNamespace = { fg = theme.palette.yellow }, -- For identifiers referring to modules and namespaces.
        -- TSNone = {},
        TSNumber = { link = "Number" }, -- For integers.
        TSOperator = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in theme.config.
        TSParameter = { fg = theme.palette.red, style = config.options.italic }, -- For parameters of a function.
        TSParameterReference = { fg = theme.palette.red }, -- For references to parameters of a function.
        TSProperty = { fg = theme.palette.red }, -- Same as `TSField`.
        TSPunctDelimiter = { link = "Delimiter" }, -- For delimiters ie: `.`
        TSPunctBracket = { fg = theme.palette.fg }, -- For brackets and parens.
        TSPunctSpecial = { fg = theme.palette.fg }, -- For special punctutation that does not fall in the catagories before.
        TSRepeat = { fg = theme.palette.purple, style = config.options.italic }, -- For keywords related to loops.
        TSString = {
            fg = theme.palette.green,
            style = config.styles.strings,
        }, -- For strings.
        TSStringRegex = {
            fg = theme.palette.green,
            style = config.styles.strings,
        }, -- For regexes.
        TSStringEscape = {
            fg = theme.palette.cyan,
            style = config.styles.strings,
        }, -- For escape characters within a string.
        TSStringSpecial = { link = "Special" }, -- For strings with special meaning that don't fit into the above categories.
        TSSymbol = { fg = theme.palette.red }, -- For identifiers referring to symbols or atoms.
        TSTag = { fg = theme.palette.red }, -- Tags like html tag names.
        TSTagAttribute = { link = "TSProperty" }, -- For html tag attributes.
        TSTagDelimiter = { link = "Delimiter" }, -- Tag delimiter like `<` `>` `/`
        TSText = { fg = theme.palette.fg }, -- For strings considered text in a markup language.
        TSStrong = { fg = theme.palette.fg, style = config.options.bold }, -- For text to be represented with strong.
        TSEmphasis = { fg = theme.palette.fg, style = config.options.italic }, -- For text to be represented with emphasis.
        TSUnderline = { fg = theme.palette.fg, style = config.options.underline }, -- For text to be represented with an underline.
        TSStrike = { fg = theme.palette.fg }, -- For strikethrough text.
        TSTitle = { fg = theme.palette.fg }, -- Text that is part of a title.
        TSLiteral = { fg = theme.palette.fg }, -- Literal text.
        TSURI = { fg = theme.palette.blue }, -- Any URI like a link or email.
        TSMath = { fg = theme.palette.fg }, -- For LaTex-like math environments.
        TSTextReference = { link = "TSText" }, -- For footnotes, text references, citations.
        TSEnvironment = { link = "Macro" }, -- For text environments of markup languages.
        TSEnvironmentName = { link = "Type" }, -- For the name/the string indicating the type of text environment.
        TSNote = { fg = theme.palette.fg }, -- Text representation of an informational note.
        TSWarning = { fg = theme.palette.yellow }, -- Text representation of a warning note.
        TSDanger = { fg = theme.palette.red }, -- Text representation of a danger note.
        TSType = { fg = theme.palette.yellow }, -- For types.
        TSTypeBuiltin = { fg = theme.palette.yellow }, -- For builtin types (you guessed it, right ?).
        TSVariable = {
            fg = theme.palette.red,
            style = config.styles.variables,
        }, -- Any variable name that does not have another highlight.
        TSVariableBuiltin = {
            fg = theme.palette.yellow,
            style = config.options.italic,
        }, -- Variable names that are defined by the languages, like `this` or `self`.
    }
end

return M
