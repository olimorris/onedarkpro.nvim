local M = {}

---Set the highlight groups for the new treesitter groups
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    -- Source:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
    return {
        -- Misc
        ["@comment"] = { link = "Comment" }, -- line and block comments
        ["@error"] = { link = "Error" }, -- syntax/parser errors
        --["@none"] -- completely disable the highlight
        --["@preproc"] -- various preprocessor directives & shebangs
        --["@define"] -- preprocessor definition directives
        ["@operator"] = { fg = theme.palette.cyan, style = config.styles.operators }, -- symbolic operators (e.g. `+` / `*`)

        -- Punctuation
        ["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g. `;` / `.` / `,`)
        ["@punctuation.bracket"] = { fg = theme.palette.fg }, -- brackets (e.g. `()` / `{}` / `[]`)
        ["@punctuation.special"] = { fg = theme.palette.fg }, -- special symbols (e.g. `{}` in string interpolation)

        -- Literals
        ["@string"] = { fg = theme.palette.green, style = config.styles.strings }, -- string literals
        ["@string.regex"] = { fg = theme.palette.green, style = config.styles.strings }, -- regular expressions
        ["@string.escape"] = { fg = theme.palette.cyan, style = config.styles.strings }, -- escape sequences
        ["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)

        ["@character"] = { link = "Character" }, -- character literals
        ["@character.special"] = { fg = theme.palette.purple }, -- special characters (e.g. wildcards)

        ["@boolean"] = { link = "Boolean" }, -- boolean literals
        ["@number"] = { link = "Number" }, -- numeric literals
        ["@float"] = { link = "Float" }, -- floating-point number literals

        -- Functions
        ["@function"] = { fg = theme.palette.blue, style = config.styles.functions }, -- function definitions
        ["@function.builtin"] = { fg = theme.palette.yellow }, -- built-in functions
        ["@function.call"] = { link = "@function" }, -- function calls
        ["@function.macro"] = { fg = theme.palette.blue }, -- preprocessor macros

        ["@method"] = { fg = theme.palette.blue, style = config.styles.methods }, -- method definitions
        ["@method.call"] = { link = "@method" }, -- method calls

        ["@constructor"] = { fg = theme.palette.yellow }, -- constructor calls and definitions
        ["@parameter"] = { fg = theme.palette.red, style = config.styles.parameters }, -- parameters of a function

        -- Keywords
        ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
        ["@keyword.function"] = { fg = theme.palette.purple, style = config.styles.functions }, -- For keywords used to define a function.
        ["@keyword.operator"] = { fg = theme.palette.purple, style = config.styles.operators }, -- For operators that are English words, e.g. `and`, `as`, `or`.
        ["@keyword.return"] = { link = "@keyword" }, -- for the `return` and `yield` keywords.

        ["@conditional"] = { fg = theme.palette.purple, style = config.styles.conditionals }, -- keywords related to conditionals (e.g. `if` / `else`)
        -- ["@conditional.ternary"] -- Ternary operator: condition ? 1 : 2
        ["@repeat"] = { link = "Repeat" }, -- keywords related to loops (e.g. `for` / `while`)
        -- ["@debug"] -- keywords related to debugging
        ["@label"] = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C)
        ["@include"] = { link = "Include" }, -- keywords for including modules (e.g. `import` / `from` in Python)
        ["@exception"] = { link = "Exception" }, -- keywords related to exceptions (e.g. `throw` / `catch`)

        -- Types
        ["@type"] = { link = "Type" }, -- type or class definitions and annotations
        ["@type.builtin"] = { link = "@type" }, -- built-in types
        ["@type.definition"] = { link = "@type" }, -- type definitions (e.g. `typedef` in C)
        ["@type.qualifier"] = { link = "@type" }, -- type qualifiers (e.g. `const`)

        --["@storageclass"] -- visibility/life-time modifiers
        ["@attribute"] = { fg = theme.palette.purple }, --attribute annotations (e.g. Python decorators)
        ["@field"] = { fg = theme.palette.fg }, -- object and struct fields
        ["@property"] = { fg = theme.palette.red }, -- similar to `@field`

        -- Identifiers
        ["@variable"] = { fg = theme.palette.red, style = config.styles.variables }, -- various variable names
        ["@variable.builtin"] = { fg = theme.palette.yellow }, -- built-in variable names (e.g. `this`)

        ["@constant"] = { fg = theme.palette.orange, style = config.styles.constants }, -- constant identifiers
        ["@constant.builtin"] = { fg = theme.palette.purple, style = config.styles.constants }, -- built-in constant values
        ["@constant.macro"] = { link = "@constant" }, -- constants defined by the preprocessor
        ["@constant.comment"] = { fg = theme.palette.purple },

        ["@namespace"] = { fg = theme.palette.yellow }, -- modules or namespaces
        ["@symbol"] = { fg = theme.palette.red }, -- symbols or atoms

        -- Text
        ["@text"] = { fg = theme.palette.fg }, -- non-structured text
        ["@text.strong"] = { link = "Bold" }, -- bold text
        -- ["@text.emphasis"] = { }, -- text with emphasis
        ["@text.underline"] = { link = "Underlined" }, -- underlined text
        ["@text.strike"] = { fg = theme.palette.fg, strikethrough = true }, -- strikethrough text
        ["@text.title"] = { link = "Title" }, -- text that is part of a title
        ["@text.literal"] = { fg = theme.palette.fg }, -- literal or verbatim text
        ["@text.uri"] = { fg = theme.palette.blue, italic = true, underline = true }, -- URIs (e.g. hyperlinks)
        ["@text.math"] = { fg = theme.palette.fg }, -- math environments (e.g. `$ ... $` in LaTeX)
        ["@text.environment"] = { link = "Macro" }, -- text environments of markup languages
        ["@text.environment.name"] = { link = "Type" }, -- text indicating the type of an environment
        ["@text.reference"] = { fg = theme.palette.fg, bold = true }, -- text references, footnotes, citations, etc.

        --["@text.todo] -- todo notes
        ["@text.todo.checked"] = { fg = theme.palette.blue },
        ["@text.todo.unchecked"] = { fg = theme.palette.bg, bg = theme.palette.fg },
        ["@text.note"] = { fg = theme.palette.fg }, -- info notes
        ["@text.warning"] = { fg = theme.palette.yellow }, -- warning notes
        ["@text.danger"] = { fg = theme.palette.red }, -- danger/error notes

        --["@text.diff.add"] -- added text (for diff files)
        --["@text.diff.delete"] -- deleted text (for diff files)
        -- Markup
        ["@markup.strong"] = { fg = theme.palette.yellow, bold = true }, -- bold text
        ["@markup.italic"] = { italic = true }, -- italic text
        ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
        ["@markup.underline"] = { underline = true }, -- underlined text (only for literal underline markup!)

        ["@markup.heading"] = { link = "Title" }, -- headings, titles (including markers)

        ["@markup.math"] = { link = "Special" }, -- math environments (e.g. `$ ... $` in LaTeX)

        ["@markup.link.label"] = { fg = theme.palette.purple }, -- link, reference descriptions
        ["@markup.link.url"] = { fg = theme.palette.blue }, -- URL-style links

        ["@markup.raw"] = { fg = theme.palette.green }, -- literal or verbatim text (e.g. inline code)

        ["@markup.list"] = { fg = theme.palette.red }, -- list markers
        ["@markup.list.checked"] = { bg = theme.palette.purple, fg = theme.palette.bg }, -- checked todo-style list markers
        ["@markup.list.unchecked"] = { fg = theme.palette.fg }, -- unchecked todo-style list markers

        -- Tags
        ["@tag"] = { fg = theme.palette.red }, -- XML tag names
        ["@tag.attribute"] = { link = "@property" }, -- XML tag attributes
        ["@tag.delimiter"] = { link = "Delimiter" }, -- XML tag delimiters

        -- Spell
        -- ["@spell"] -- for defining regions to be spellchecked
        -- ["@nospell"] -- for defining regions that should NOT be spellchecked

        -- Locals
        -- ["@definition"] -- various definitions
        -- ["@definition.constant"] -- constants
        -- ["@definition.function"] -- functions
        -- ["@definition.method"] -- methods
        -- ["@definition.var"] --variables
        -- ["@definition.parameter"] -- parameters
        -- ["@definition.macro"] -- preprocessor macros
        -- ["@definition.type"] -- types or classes
        -- ["@definition.field"] -- fields or properties
        -- ["@definition.enum"] -- enumerations
        -- ["@definition.namespace"] -- modules or namespaces
        -- ["@definition.import"] -- imported names
        -- ["@definition.associated"] -- the associated type of a variable

        -- ["@scope"] -- scope block
        -- ["@reference"] -- identifier reference
    }
end

return M
