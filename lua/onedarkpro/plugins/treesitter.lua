local M = {}

---Get the highlight groups for the plugin
---@param theme table
---@return table
function M.get(theme)
    return {
        -- https://github.com/nvim-treesitter/nvim-treesitter/blob/fb5d6e04a87863d01a45dab2cbafec4e2a74822b/doc/nvim-treesitter.txt
        TSAnnotation = { fg = theme.colors.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute = { fg = theme.colors.purple }, -- (unstable)
        TSBoolean = { link = "Boolean" }, -- For booleans.
        TSCharacter = { link = "Character" }, -- For characters.
        TSComment = { link = "Comment" }, -- For comment blocks.
        TSConditional = { link = "Conditional" }, -- For keywords related to conditionnals.
        TSConstant = { link = "Constant" }, -- For constants
        TSConstBuiltin = { fg = theme.colors.purple }, -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro = { link = "Constant" }, -- For constants that are defined by macros: `NULL` in theme.config.
        TSConstructor = { fg = theme.colors.yellow }, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
        TSError = { link = "Error" }, -- For syntax/parser errors.
        TSException = { link = "Exception" }, -- For exception related keywords.
        TSField = { fg = theme.colors.fg }, -- For fields (responsible for making YAML files look rubbish!)
        TSFloat = { link = "Float" }, -- For floats.
        TSFunction = {
            fg = theme.colors.blue,
            style = theme.config.styles.functions,
        }, -- For function (calls and definitions).
        TSFuncBuiltin = { fg = theme.colors.yellow }, -- For builtin functions: `table.insert` in Lua.
        TSFuncMacro = { fg = theme.colors.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = { fg = theme.colors.purple, style = theme.options.italic }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSKeyword = {
            fg = theme.colors.purple,
            style = theme.config.styles.keywords,
        }, -- For keywords that don't fall in previous categories.
        TSKeywordFunction = {
            fg = theme.colors.purple,
            style = theme.config.styles.keywords,
        }, -- For keywords used to define a fuction.
        TSKeywordOperator = {
            fg = theme.colors.purple,
            style = theme.options.italic,
        }, -- For operators that are English words, e.g. `and`, `as`, `or`.
        TSKeywordReturn = { link = "TSKeyword" }, -- for the `return` and `yield` keywords.
        TSLabel = { fg = theme.colors.purple, style = theme.options.italic }, -- For labels: `label:` in C and `:label:` in Lua.
        TSMethod = { fg = theme.colors.blue }, -- For method calls and definitions.
        TSNamespace = { fg = theme.colors.yellow }, -- For identifiers referring to modules and namespaces.
        -- TSNone = {},
        TSNumber = { link = "Number" }, -- For integers.
        TSOperator = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in theme.config.
        TSParameter = { fg = theme.colors.red, style = theme.options.italic }, -- For parameters of a function.
        TSParameterReference = { fg = theme.colors.red }, -- For references to parameters of a function.
        TSProperty = { fg = theme.colors.red }, -- Same as `TSField`.
        TSPunctDelimiter = { link = "Delimiter" }, -- For delimiters ie: `.`
        TSPunctBracket = { fg = theme.colors.fg }, -- For brackets and parens.
        TSPunctSpecial = { fg = theme.colors.fg }, -- For special punctutation that does not fall in the catagories before.
        TSRepeat = { fg = theme.colors.purple, style = theme.options.italic }, -- For keywords related to loops.
        TSString = {
            fg = theme.colors.green,
            style = theme.config.styles.strings,
        }, -- For strings.
        TSStringRegex = {
            fg = theme.colors.green,
            style = theme.config.styles.strings,
        }, -- For regexes.
        TSStringEscape = {
            fg = theme.colors.cyan,
            style = theme.config.styles.strings,
        }, -- For escape characters within a string.
        TSStringSpecial = { link = "Special" }, -- For strings with special meaning that don't fit into the above categories.
        TSSymbol = { fg = theme.colors.red }, -- For identifiers referring to symbols or atoms.
        TSTag = { fg = theme.colors.red }, -- Tags like html tag names.
        TSTagAttribute = { link = "TSProperty" }, -- For html tag attributes.
        TSTagDelimiter = { link = "Delimiter" }, -- Tag delimiter like `<` `>` `/`
        TSText = { fg = theme.colors.fg }, -- For strings considered text in a markup language.
        TSStrong = { fg = theme.colors.fg, style = theme.options.bold }, -- For text to be represented with strong.
        TSEmphasis = { fg = theme.colors.fg, style = theme.options.italic }, -- For text to be represented with emphasis.
        TSUnderline = { fg = theme.colors.fg, style = theme.options.underline }, -- For text to be represented with an underline.
        TSStrike = { fg = theme.colors.fg }, -- For strikethrough text.
        TSTitle = { fg = theme.colors.fg }, -- Text that is part of a title.
        TSLiteral = { fg = theme.colors.fg }, -- Literal text.
        TSURI = { fg = theme.colors.blue }, -- Any URI like a link or email.
        TSMath = { fg = theme.colors.fg }, -- For LaTex-like math environments.
        TSTextReference = { link = "TSText" }, -- For footnotes, text references, citations.
        TSEnvironment = { link = "Macro" }, -- For text environments of markup languages.
        TSEnvironmentName = { link = "Type" }, -- For the name/the string indicating the type of text environment.
        TSNote = { fg = theme.colors.fg }, -- Text representation of an informational note.
        TSWarning = { fg = theme.colors.yellow }, -- Text representation of a warning note.
        TSDanger = { fg = theme.colors.red }, -- Text representation of a danger note.
        TSType = { fg = theme.colors.yellow }, -- For types.
        TSTypeBuiltin = { fg = theme.colors.yellow }, -- For builtin types (you guessed it, right ?).
        TSVariable = {
            fg = theme.colors.red,
            style = theme.config.styles.variables,
        }, -- Any variable name that does not have another highlight.
        TSVariableBuiltin = {
            fg = theme.colors.yellow,
            style = theme.options.italic,
        }, -- Variable names that are defined by the languages, like `this` or `self`.
    }
end

return M
