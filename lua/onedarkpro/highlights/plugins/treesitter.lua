local M = {}

---Set the highlight groups for the new treesitter groups
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    -- Source:
    -- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
    return {
        -- Identifiers
        ["@variable"] = { fg = theme.palette.red, style = config.styles.variables }, -- various variable names
        ["@variable.builtin"] = { fg = theme.palette.yellow }, -- built-in variable names (e.g. `this`)
        ["@variable.parameter"] = { fg = theme.palette.red, style = config.styles.parameters }, -- parameters of a function
        ["@variable.member"] = { fg = theme.palette.red }, -- object and struct fields

        ["@constant"] = { fg = theme.palette.orange, style = config.styles.constants }, -- constant identifiers
        ["@constant.builtin"] = { fg = theme.palette.purple, style = config.styles.constants }, -- built-in constant values
        ["@constant.macro"] = { link = "@constant" }, -- constants defined by the preprocessor

        ["@module"] = { fg = theme.palette.yellow }, -- modules or namespaces
        ["@label"] = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C)

        -- Literals
        ["@string"] = { fg = theme.palette.green, style = config.styles.strings }, -- string literals
        ["@string.regex"] = { fg = theme.palette.green, style = config.styles.strings }, -- regular expressions
        ["@string.escape"] = { fg = theme.palette.cyan, style = config.styles.strings }, -- escape sequences
        ["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
        ["@string.special.symbol"] = { fg = theme.palette.red }, -- symbols or atoms
        ["@string.special.url"] = { fg = theme.palette.blue, italic = true, underline = true }, -- URIs (e.g. hyperlinks)

        ["@character"] = { link = "Character" }, -- character literals
        ["@character.special"] = { fg = theme.palette.purple }, -- special characters (e.g. wildcards)

        ["@boolean"] = { link = "Boolean" }, -- boolean literals
        ["@number"] = { link = "Number" }, -- numeric literals
        ["@number.float"] = { link = "Float" }, -- floating-point number literals

        -- Types
        ["@type"] = { link = "Type" }, -- type or class definitions and annotations
        ["@type.builtin"] = { link = "@type" }, -- built-in types
        ["@type.definition"] = { link = "@type" }, -- type definitions (e.g. `typedef` in C)
        ["@type.qualifier"] = { link = "@type" }, -- type qualifiers (e.g. `const`)

        ["@attribute"] = { fg = theme.palette.purple }, --attribute annotations (e.g. Python decorators)
        ["@property"] = { fg = theme.palette.red }, -- similar to `@field`

        -- Functions
        ["@function"] = { fg = theme.palette.blue, style = config.styles.functions }, -- function definitions
        ["@function.builtin"] = { fg = theme.palette.yellow }, -- built-in functions
        ["@function.call"] = { link = "@function" }, -- function calls
        ["@function.macro"] = { fg = theme.palette.blue }, -- preprocessor macros

        ["@function.method"] = { fg = theme.palette.blue, style = config.styles.methods }, -- method definitions
        ["@function.method.call"] = { link = "@function.method" }, -- method calls

        ["@constructor"] = { fg = theme.palette.yellow }, -- constructor calls and definitions
        ["@operator"] = { fg = theme.palette.cyan, style = config.styles.operators }, -- symbolic operators (e.g. `+` / `*`)

        -- Keywords
        ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
        ["@keyword.function"] = { fg = theme.palette.purple, style = config.styles.functions }, -- For keywords used to define a function.
        ["@keyword.operator"] = { fg = theme.palette.purple, style = config.styles.operators }, -- For operators that are English words, e.g. `and`, `as`, `or`.
        ["@keyword.import"] = { link = "@keyword" }, -- keywords for including modules (e.g. `import` / `from` in Python)
        ["@keyword.repeat"] = { link = "@keyword" }, -- keywords related to loops (e.g. `for` / `while`)
        ["@keyword.return"] = { link = "@keyword" }, -- for the `return` and `yield` keywords.
        ["@keyword.exception"] = { link = "@keyword" }, -- keywords related to exceptions (e.g. `throw` / `catch`)

        ["@keyword.conditional"] = { fg = theme.palette.purple, style = config.styles.conditionals }, -- keywords related to conditionals (e.g. `if` / `else`)

        -- Punctuation
        ["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g. `;` / `.` / `,`)
        ["@punctuation.bracket"] = { fg = theme.palette.purple }, -- brackets (e.g. `()` / `{}` / `[]`)
        ["@punctuation.special"] = { fg = theme.palette.fg }, -- special symbols (e.g. `{}` in string interpolation)

        -- Comments
        ["@comment"] = { link = "Comment" }, -- line and block comments
        ["@comment.error"] = { bg = theme.palette.red, fg = theme.palette.bg }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED:`)
        ["@comment.warning"] = { bg = theme.palette.yellow, fg = theme.palette.bg }, -- warning-type comments (e.g. `WARNING:`, `FIX:`, `HACK:`)
        ["@comment.todo"] = { bg = theme.palette.blue, fg = theme.palette.bg }, -- todo-type comments (e.g. `TODO:`, `WIP:`, `FIXME:`)
        ["@comment.note"] = { bg = theme.palette.cyan, fg = theme.palette.bg }, -- note-type comments (e.g. `NOTE:`, `INFO:`, `XXX`)

        -- Markup
        ["@markup.strong"] = { fg = theme.palette.yellow, bold = true }, -- bold text
        ["@markup.italic"] = { italic = true }, -- italic text
        ["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
        ["@markup.underline"] = { underline = true }, -- underlined text (only for literal underline markup!)

        ["@markup.heading"] = { fg = theme.palette.green, bold = true }, -- headings, titles (including markers)

        ["@markup.math"] = { link = "Special" }, -- math environments (e.g. `$ ... $` in LaTeX)

        ["@markup.link.label"] = { fg = theme.palette.blue }, -- link, reference descriptions
        ["@markup.link.url"] = { fg = theme.palette.purple }, -- URL-style links

        ["@markup.raw"] = { fg = theme.palette.green }, -- literal or verbatim text (e.g. inline code)
        ["@markup.raw.delimiter"] = { fg = theme.palette.gray },

        ["@markup.list"] = { fg = theme.palette.red }, -- list markers
        ["@markup.list.checked"] = { bg = theme.palette.purple, fg = theme.palette.bg }, -- checked todo-style list markers
        ["@markup.list.unchecked"] = { fg = theme.palette.fg }, -- unchecked todo-style list markers

        -- Tags
        ["@tag"] = { fg = theme.palette.red }, -- XML tag names
        ["@tag.attribute"] = { link = "@property" }, -- XML tag attributes
        ["@tag.delimiter"] = { link = "Delimiter" }, -- XML tag delimiters
    }
end

return M
