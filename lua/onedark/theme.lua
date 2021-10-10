local M = {}

function M.apply(colors, config)
	local config = config or require("onedark.config").options
	local colors = colors or require("onedark.colors").load()

	local theme = {}
	theme.config = config
	theme.colors = colors
	local c = theme.colors

	theme.groups = {
		ColorColumn = { bg = c.color_column }, -- used for the columns set with 'colorcolumn'
		Comment = { fg = c.comment, style = config.styles.comments }, -- Comments
		-- Conceal      = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = c.blue, fg = c.bg }, -- character under the cursor
		-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     = {bg = c.red}, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = c.gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = c.selection }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLineNr = { fg = c.purple, style = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		Directory = { fg = c.blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = c.green, fg = c.black }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = c.yellow, style = "underline" }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = c.red, fg = c.bg },
		DiffText = { bg = c.yellow, fg = c.bg }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   = {}, -- cursor in a focused terminal
		-- TermCursorNC = {}, -- cursor in an unfocused terminal
		ErrorMsg = { fg = c.red }, -- error messages on the command line
		Folded = { fg = c.gray }, -- line used for closed folds
		-- FoldColumn = {}, -- 'foldcolumn'
		SignColumn = { bg = c.bg }, -- column where |signs| are displayed
		IncSearch = { bg = c.selection, fg = c.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute = { bg = c.yellow, fg = c.bg }, -- |:substitute| replacement text highlighting
		LineNr = { fg = c.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		MatchParen = { fg = c.cyan, style = "underline" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { "ModeMsg" }, -- Area for messages and cmdline
		MsgSeparator = { "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = c.green }, -- |more-prompt|
		NonText = { fg = c.gray }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { bg = c.bg, fg = c.fg }, -- normal text
		NormalFloat = { "Normal" }, -- Normal text in floating windows.
		FloatBorder = { fg = c.gray },
		NormalNC = { "Normal" }, -- normal text in non-current windows
		Pmenu = { bg = c.menu }, -- Popup menu: normal item.
		PmenuSel = { bg = c.blue, fg = c.bg }, -- Popup menu: selected item.
		PmenuSbar = { bg = c.menu_scroll }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = c.menu_scroll_thumb }, -- Popup menu: Thumb of the scrollbar.
		Question = { fg = c.gray }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = c.gray }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		-- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { bg = c.bg, fg = c.fg }, -- status line of current window
		StatusLineNC = { bg = c.bg, fg = c.fg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = c.bg }, -- tab pages line, not active tab page label
		TabLineFill = { bg = c.bg, fg = c.fg }, -- tab pages line, where there are no labels
		TabLineSel = { bg = c.comment, fg = c.purple }, -- tab pages line, active tab page label
		Title = { fg = c.green }, -- titles for output from ":set all", ":autocmd" etc.
		VertSplit = { fg = c.gray }, -- the column separating vertically split windows
		Visual = { bg = c.selection }, -- Visual mode selection
		VisualNOS = { "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = c.yellow }, -- warning messages
		Whitespace = { fg = c.comment }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = c.blue, fg = c.black }, -- current match in 'wildmenu' completion

		-- Syntax groups
		Constant = { fg = c.cyan }, -- (preferred) any constant
		String = { fg = c.green, style = config.styles.strings }, --   a string constant: "this is a string"
		Character = { fg = c.green }, -- a character constant: 'c', '\n'
		Number = { fg = c.yellow }, -- a number constant: 234, 0xff
		Boolean = { fg = c.yellow }, -- a boolean constant: TRUE, false
		Float = { fg = c.yellow }, -- a floating point constant: 2.3e10

		Identifier = { fg = c.purple, style = config.styles.variables }, -- (preferred) any variable name
		Function = { fg = c.yellow, style = config.styles.functions }, -- function name (also: methods for classes)

		Statement = { fg = c.purple }, -- (preferred) any statement
		Conditional = { fg = c.purple }, --  if, then, else, endif, switch, etc.
		Repeat = { fg = c.purple }, -- for, do, while, etc.
		Label = { fg = c.red }, -- case, default, etc.
		Operator = { fg = c.cyan }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = c.red, style = config.styles.keywords }, -- any other keyword
		Exception = { fg = c.purple }, -- try, catch, throw

		PreProc = { fg = c.yellow }, -- (preferred) generic Preprocessor
		Include = { fg = c.purple }, -- preprocessor #include
		Define = { fg = c.purple }, -- preprocessor #define
		Macro = { fg = c.purple }, -- same as Define
		PreCondit = { fg = c.yellow }, -- preprocessor #if, #else, #endif, etc.

		Type = { fg = c.yellow }, -- (preferred) int, long, char, etc.
		StorageClass = { fg = c.yellow }, -- static, register, volatile, etc.
		Structure = { fg = c.yellow }, -- struct, union, enum, etc.
		Typedef = { fg = c.yellow }, -- A typedef

		Special = { fg = c.blue }, -- (preferred) any special symbol
		SpecialChar = { fg = c.yellow }, -- special character in a constant
		-- Tag = {}, -- you can use CTRL-] on this
		Delimiter = { fg = c.fg }, -- character that needs attention
		SpecialComment = { fg = c.comment }, -- special things inside a comment
		--     Debug = {}, -- debugging statements

		Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
		Bold = { style = "bold" },
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
		Italic = { style = "italic" },
		Error = { fg = c.red }, -- (preferred) any erroneous construct
		Todo = { fg = c.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- LSP
		LspDiagnosticsDefaultError = { fg = c.red },
		LspDiagnosticsDefaultWarning = { fg = c.yellow },
		LspDiagnosticsDefaultInformation = { fg = c.blue },
		LspDiagnosticsDefaultHint = { fg = c.cyan },

		LspDiagnosticsSignError = { "LspDiagnosticsDefaultError" },
		LspDiagnosticsSignWarning = { "LspDiagnosticsDefaultWarning" },
		LspDiagnosticsSignInformation = { "LspDiagnosticsDefaultInformation" },
		LspDiagnosticsSignHint = { "LspDiagnosticsDefaultHint" },

		LspDiagnosticsUnderlineError = { fg = c.red, style = "undercurl" },
		LspDiagnosticsUnderlineWarning = { fg = c.yellow, style = "undercurl" },
		LspDiagnosticsUnderlineInformation = { fg = c.blue, style = "undercurl" },
		LspDiagnosticsUnderlineHint = { style = "undercurl" },

		LspDiagnosticsVirtualTextError = { "LspDiagnosticsDefaultError" },
		LspDiagnosticsVirtualTextWarning = { "LspDiagnosticsDefaultWarning" },
		LspDiagnosticsVirtualTextInformation = { "LspDiagnosticsDefaultInformation" },
		LspDiagnosticsVirtualTextHint = { "LspDiagnosticsDefaultHint" },

		LspReferenceText = { bg = c.selection }, -- used for highlighting "text" references
		LspReferenceRead = { "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { "LspReferenceText" }, -- used for highlighting "write" references

		-- TreeSitter
		-- https://github.com/nvim-treesitter/nvim-treesitter/blob/fb5d6e04a87863d01a45dab2cbafec4e2a74822b/doc/nvim-treesitter.txt
		TSAnnotation = { fg = c.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		TSAttribute = { fg = c.purple }, -- (unstable)
		TSBoolean = { fg = c.yellow }, -- For booleans.
		TSCharacter = { fg = c.green }, -- For characters.
		TSComment = { "Comment" }, -- For comment blocks.
		TSConditional = { fg = c.purple, style = "italic" }, -- For keywords related to conditionnals.
		TSConstant = { fg = c.yellow }, -- For constants
		TSConstBuiltin = { fg = c.yellow }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro = { fg = c.yellow }, -- For constants that are defined by macros: `NULL` in C.
		TSConstructor = { fg = c.cyan }, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
		TSError = { fg = c.red }, -- For syntax/parser errors.
		TSException = { fg = c.green }, -- For exception related keywords.
		TSField = { fg = c.red }, -- For fields.
		TSFloat = { fg = c.yellow }, -- For floats.
		TSFunction = { fg = c.blue, style = config.styles.functions }, -- For function (calls and definitions).
		TSFuncBuiltin = { fg = c.blue }, -- For builtin functions: `table.insert` in Lua.
		TSFuncMacro = { fg = c.cyan }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = c.purple, style = "italic" }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword = { fg = c.purple, style = config.styles.keywords }, -- For keywords that don't fall in previous categories.
		TSKeywordFunction = { "TSKeyword" }, -- For keywords used to define a fuction.
		TSKeywordOperator = { fg = c.red }, -- For operators that are English words, e.g. `and`, `as`, `or`.
		TSKeywordReturn = { "TSKeyword" }, -- for the `return` and `yield` keywords.
		TSLabel = { fg = c.purple, style = "italic" }, -- For labels: `label:` in C and `:label:` in Lua.
		TSMethod = { fg = c.blue }, -- For method calls and definitions.
		TSNamespace = { fg = c.purple }, -- For identifiers referring to modules and namespaces.
		-- TSNone = {},
		TSNumber = { fg = c.yellow }, -- For integers.
		TSOperator = { fg = c.cyan }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = c.yellow, style = "italic" }, -- For parameters of a function.
		TSParameterReference = { fg = c.yellow }, -- For references to parameters of a function.
		TSProperty = { fg = c.red }, -- Same as `TSField`.
		TSPunctDelimiter = { fg = c.fg }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = c.red }, -- For brackets and parens.
		TSPunctSpecial = { fg = c.fg }, -- For special punctutation that does not fall in the catagories before.
		TSRepeat = { fg = c.purple, style = "italic" }, -- For keywords related to loops.
		TSString = { fg = c.green, style = config.styles.strings }, -- For strings.
		TSStringRegex = { fg = c.green, style = config.styles.strings }, -- For regexes.
		TSStringEscape = { fg = c.cyan, style = config.styles.strings }, -- For escape characters within a string.
		TSStringSpecial = { "Special" }, -- For strings with special meaning that don't fit into the above categories.
		TSSymbol = { fg = c.red }, -- For identifiers referring to symbols or atoms.
		TSTag = { fg = c.red }, -- Tags like html tag names.
		TSTagAttribute = { "TSProperty" }, -- For html tag attributes.
		TSTagDelimiter = { "Delimiter" }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = c.fg }, -- For strings considered text in a markup language.
		TSStrong = { fg = c.yellow, style = "bold" }, -- For text to be represented with strong.
		TSEmphasis = { fg = c.yellow, style = "italic" }, -- For text to be represented with emphasis.
		TSUnderline = { fg = c.yellow, style = "underline" }, -- For text to be represented with an underline.
		TSStrike = { fg = c.fg }, -- For strikethrough text.
		TSTitle = { fg = c.yellow }, -- Text that is part of a title.
		TSLiteral = { fg = c.yellow }, -- Literal text.
		TSURI = { fg = c.blue }, -- Any URI like a link or email.
		TSMath = { fg = c.fg }, -- For LaTex-like math environments.
		TSTextReference = { "TSText" }, -- For footnotes, text references, citations.
		TSEnvironment = { "Macro" }, -- For text environments of markup languages.
		TSEnvironmentName = { "Type" }, -- For the name/the string indicating the type of text environment.
		TSNote = { fg = c.fg }, -- Text representation of an informational note.
		TSWarning = { fg = c.yellow }, -- Text representation of a warning note.
		TSDanger = { fg = c.red }, -- Text representation of a danger note.
		TSType = { fg = c.yellow }, -- For types.
		TSTypeBuiltin = { fg = c.red }, -- For builtin types (you guessed it, right ?).
		TSVariable = { style = config.styles.variables }, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = c.yellow, style = "italic" }, -- Variable names that are defined by the languages, like `this` or `self`.

		-- CSS
		cssAttrComma = { fg = c.purple },
		cssAttributeSelector = { fg = c.green },
		cssBraces = { fg = c.red },
		cssClassName = { fg = c.yellow },
		cssClassNameDot = { fg = c.yellow },
		cssDefinition = { fg = c.purple, style = "bold,italic" },
		cssFontAttr = { fg = c.yellow },
		cssFontDescriptor = { "cssDefinition" },
		cssFunctionName = { fg = c.blue },
		cssIdentifier = { fg = c.blue },
		cssImportant = { "cssDefinition" },
		cssInclude = { fg = c.fg },
		cssIncludeKeyword = { "cssDefinition" },
		cssMediaType = { fg = c.yellow },
		cssProp = { fg = c.fg },
		cssPseudoClassId = { fg = c.yellow },
		cssSelectorOp = { "cssDefinition" },
		cssSelectorOp2 = { "cssDefinition" },
		cssTagName = { fg = c.red },

		-- Git
		diffAdded = { fg = c.green },
		diffChanged = { fg = c.yellow },
		diffRemoved = { fg = c.red },
		diffFile = { fg = c.yellow },
		diffNewFile = { fg = c.yellow },
		diffLine = { fg = c.blue },
		GitGutterAdd = { "diffAdded" },
		GitGutterChange = { "diffChanged" },
		GitGutterDelete = { "diffRemoved" },
		GitGutterChangeDelete = { "diffRemoved" },

		-- HTML
		htmlArg = { fg = c.purple, style = "bold,italic" },
		htmlBold = { fg = c.yellow, style = "bold" },
		htmlItalic = { fg = c.purple, style = "italic" },
		htmlLink = { fg = c.cyan, style = "underline" },
		htmlH1 = { fg = c.red },
		htmlH2 = { "htmlH1" },
		htmlH3 = { "htmlH1" },
		htmlH4 = { "htmlH1" },
		htmlH5 = { "htmlH1" },
		htmlH6 = { "htmlH1" },
		htmlSpecialChar = { fg = c.yellow },
		htmlSpecialTagName = { fg = c.red },
		htmlTag = { "TSTag" },
		htmlEndTag = { "htmlTag" },
		htmlTagN = { fg = c.red },
		htmlTagName = { fg = c.red },
		htmlTitle = { fg = c.fg },

		-- Javascript
		javascriptBraces = { fg = c.red },
		javaScriptFunction = { fg = c.purple },
		javaScriptIdentifier = { fg = c.purple },
		javaScriptNull = { fg = c.yellow },
		javaScriptNumber = { fg = c.yellow },
		javaScriptRequire = { fg = c.cyan },
		javaScriptReserved = { fg = c.purple },
		---- https://github.com/pangloss/vim-javascript included in Vim-Polygot
		jsArrowFunction = { fg = c.purple, style = "bold,italic" },
		jsClassKeyword = { "jsArrowFunction" },
		jsClassMethodType = { "jsArrowFunction" },
		jsDocParam = { fg = c.blue },
		jsDocTags = { fg = c.purple },
		jsExport = { "jsArrowFunction" },
		jsExportDefault = { "jsExport" },
		jsExtendsKeyword = { "jsClassKeyword" },
		jsFrom = { "jsExport" },
		jsFuncCall = { fg = c.blue },
		jsFunction = { "jsArrowFunction" },
		jsGenerator = { fg = c.yellow },
		jsGlobalObjects = { "jsGenerator" },
		jsImport = { "jsExport" },
		jsModuleAs = { "jsExport" },
		jsModuleWords = { "jsExport" },
		jsModules = { "jsExport" },
		jsNull = { fg = c.yellow },
		jsOperator = { fg = c.purple },
		jsStorageClass = { "jsClassKeyword" },
		jsSuper = { fg = c.red },
		jsTemplateBraces = { fg = c.red },
		jsTemplateVar = { fg = c.green },
		jsThis = { fg = c.red },
		jsUndefined = { fg = c.yellow },

		-- JSON
		jsonCommentError = { fg = c.fg },
		jsonKeyword = { fg = c.red },
		jsonBoolean = { fg = c.yellow },
		jsonNumber = { fg = c.yellow },
		jsonQuote = { fg = c.fg },
		jsonMissingCommaError = { fg = c.red, style = "reverse" },
		jsonNoQuotesError = { "jsonMissingCommaError" },
		jsonNumError = { "jsonMissingCommaError" },
		jsonString = { fg = c.green },
		jsonStringSQError = { "jsonMissingCommaError" },
		jsonSemicolonError = { "jsonMissingCommaError" },

		-- Markdown
		markdownBlockquote = { fg = c.comment },
		markdownBold = { fg = c.yellow, style = "bold" },
		markdownCode = { fg = c.green },
		markdownCodeBlock = { "markdownCode" },
		markdownCodeDelimiter = { "markdownCode" },
		markdownH1 = { fg = c.red },
		markdownH2 = { "markdownH1" },
		markdownH3 = { "markdownH1" },
		markdownH4 = { "markdownH1" },
		markdownH5 = { "markdownH1" },
		markdownH6 = { "markdownH1" },
		markdownHeadingDelimiter = { fg = c.red },
		markdownHeadingRule = { "markdownBlockquote" },
		markdownId = { fg = c.purple, style = "bold,italic" },
		markdownIdDeclaration = { fg = c.blue },
		markdownIdDelimiter = { "markdownId" },
		markdownItalic = { fg = c.purple, style = "italic" },
		markdownLinkDelimiter = { fg = c.purple },
		markdownLinkText = { fg = c.blue },
		markdownListMarker = { fg = c.red },
		markdownOrderedListMarker = { "markdownListMarker" },
		markdownRule = { "markdownBlockquote" },
		markdownUrl = { fg = c.cyan, style = "underline" },

		-- Python
		pythonNone = { fg = c.yellow },
		pythonBoolean = { "pythonNone" },
		pythonClass = { fg = c.yellow },
		pythonParens = { fg = c.red },
		pythonBuiltinObj = { fg = c.cyan, style = "bold" },
		pythonSpaceError = { bg = c.red, fg = c.fg },
		pythonString = { fg = c.green },
		pythonDot = { fg = c.fg },
		pythonImport = { fg = c.purple, style = "bold,italic" },
		pythonRepeat = { "pythonImport" },
		pythonStatement = { "pythonImport" },
		pythonOperator = { "pythonImport" },

		-- Ruby
		rubyBlockParameter = { fg = c.red },
		rubyBlockParameterList = { "rubyBlockParameter" },
		rubyClass = { fg = c.purple, style = "bold,italic" },
		rubyConstant = { fg = c.yellow },
		rubyControl = { "rubyClass" },
		rubyEscape = { fg = c.red },
		rubyFunction = { fg = c.blue },
		rubyGlobalVariable = { fg = c.red },
		rubyInclude = { fg = c.blue },
		rubyIncluderubyGlobalVariable = { "rubyGlobalVariable" },
		rubyInstanceVariable = { "rubyGlobalVariable" },
		rubyInterpolation = { fg = c.cyan },
		rubyInterpolationDelimiter = { fg = c.red },
		rubyRegexp = { fg = c.cyan },
		rubyRegexpDelimiter = { "rubyRegexp" },
		rubyStringDelimiter = { fg = c.green },
		rubySymbol = { fg = c.cyan },

		-- SASS
		sassidChar = { fg = c.red },
		sassClassChar = { fg = c.yellow },
		sassInclude = { fg = c.purple, style = "bold,italic" },
		sassMixing = { "sassInclude" },
		sassMixinName = { fg = c.blue },
		scssExtend = { "sassInclude" },
		scssImport = { "sassInclude" },
		scssMixin = { "sassMixing" },
		scssSelectorName = { fg = c.yellow },
		scssVariable = { "sassMixing" },

		-- Barbar.nvim
		BufferCurrent = { fg = c.purple, bg = c.bg },
		BufferCurrentIndex = { "BufferCurrent" },
		BufferCurrentMod = { fg = c.purple },
		BufferCurrentSign = { "BufferCurrentMod" },
		BufferCurrentIcon = { "BufferCurrentMod" },
		BufferCurrentTarget = { bg = c.bg, fg = c.blue, style = "bold" },
		BufferVisible = { fg = c.gray },
		BufferVisibleIndex = { "BufferVisible" },
		BufferVisibleMod = { "BufferVisible" },
		BufferVisibleSign = { "BufferVisibleMod" },
		BufferVisibleIcon = { "BufferVisibleMod" },
		BufferVisibleTarget = { "BufferCurrentTarget" },
		BufferInactive = { "BufferVisible" }, -- Buffer which is not active
		BufferInactiveIndex = { "BufferInactive" },
		BufferInactiveMod = { "BufferInactive" },
		BufferInactiveSign = { fg = c.bg }, -- The inactive sign of a buffer
		BufferInactiveTarget = { "BufferCurrentTarget" },
		BufferTabpages = { fg = c.purple }, -- The tab page indicator on the right
		BufferTabpageFill = { fg = c.bg }, -- The sign which marks the end of the bufferline

		-- Dap UI
		DapUIScope = { bg = c.blue, fg = c.bg },
		DapUIType = { fg = c.blue },
		DapUIDecoration = { fg = c.blue },
		DapUIThread = { fg = c.purple },
		DapUIStoppedThread = { bg = c.purple, fg = c.bg },
		DapUIFrameName = { fg = c.fg },
		DapUISource = { fg = c.purple },
		DapUIBreakpointsPath = { bg = c.yellow, fg = c.bg },
		DapUIBreakpointsInfo = { fg = c.fg },
		DapUIBreakpointsCurrentLine = { fg = c.yellow, style = "bold" },
		DapUIBreakpointsLine = { "DapUIBreakpointsCurrentLine" },
		DapUIWatchesEmpty = { bg = c.red, fg = c.bg },
		DapUIWatchesValue = { fg = c.red },
		DapUIWatchesError = { fg = c.red },

		-- Dashboard
		-- dashboardHeader = {},
		dashboardCenter = { fg = c.purple, style = "bold" },
		dashboardFooter = { fg = c.blue },
		--dashboardShortCut = {},

		-- hlslens
		HlSearchNear = { bg = c.highlight, fg = c.bg },
		HlSearchLens = { bg = c.gray },
		HlSearchLensNear = { "HlSearchNear" },
		HlSearchFloat = { "HlSearchNear" },

		-- Indentline
		IndentLine = { fg = c.indentline },
		IndentBlanklineChar = { "IndentLine" },
		IndentBlanklineSpaceChar = { "IndentLine" },
		IndentBlanklineSpaceCharBlankline = { "IndentLine" },
		IndentBlanklineContextChar = { "IndentLine" },

		-- LSP Saga
		LspSagaDiagnosticBorder = { "NormalNC" },
		LspSagaDiagnosticHeader = { fg = c.purple },
		LspSagaDiagnosticTruncateLine = { "NormalNC" },
		LspFloatWinBorder = { "NormalNC" },
		LspSagaBorderTitle = { "Title" },
		TargetWord = { "Error" },
		ReferencesCount = { "Title" },
		ReferencesIcon = { "Special" },
		DefinitionCount = { "Title" },
		TargetFileName = { fg = c.comment },
		DefinitionIcon = { "Special" },
		ProviderTruncateLine = { "NormalNC" },
		SagaShadow = {},
		LspSagaFinderSelection = { "Search" },
		DiagnosticTruncateLine = { "NormalNC" },
		DiagnosticError = { "LspDiagnosticsDefaultError" },
		DiagnosticWarning = { "LspDiagnosticsDefaultWarning" },
		DiagnosticInformation = { "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { "LspDiagnosticsDefaultHint" },
		DefinitionPreviewTitle = { "Title" },
		LspSagaShTruncateLine = { "NormalNC" },
		LspSagaDocTruncateLine = { "NormalNC" },
		LineDiagTuncateLine = { "NormalNC" },
		LspSagaCodeActionTitle = { "Title" },
		LspSagaCodeActionTruncateLine = { "NormalNC" },
		LspSagaCodeActionContent = { "Normal" },
		LspSagaRenamePromptPrefix = { fg = c.purple },
		LspSagaRenameBorder = { style = "bold" },
		LspSagaHoverBorder = { style = "bold" },
		LspSagaSignatureHelpBorder = { style = "bold" },
		LspSagaCodeActionBorder = { style = "bold" },
		LspSagaAutoPreview = {},
		LspSagaDefPreviewBorder = { style = "bold" },
		LspLinesDiagBorder = { style = "bold" },

		--nvim-compe and nvim-cmp
		CompeDocumentation = { fg = c.fg, bg = c.menu },
		CmpDocumentation = { fg = c.fg, bg = c.menu },
		CmpDocumentationBorder = { fg = c.fg, bg = c.menu },
		CmpItemAbbr = { fg = c.fg },
		CmpItemAbbrMatch = { fg = c.fg, style = config.styles.keywords },
		CmpItemKind = { fg = c.blue },
		CmpItemMenu = { fg = c.fg },

		--nvim-dap
		DebugBreakpoint = { fg = c.red },
		DebugBreakpointLine = { fg = c.red, style = "underline" },
		DebugHighlight = { fg = c.blue },
		DebugHighlightLine = { fg = c.purple, style = "italic" },
		NvimDapVirtualText = { fg = c.cyan, style = "italic,underline" },

		--nvim-tree
		NvimTreeRootFolder = { fg = c.purple, style = "bold" },
		NvimTreeFolderName = { fg = c.blue },
		NvimTreeIndentMarker = { fg = c.gray },
		NvimTreeSymlink = { fg = c.cyan, style = "underline" },
		NvimTreeFolderIcon = { fg = c.purple },
		NvimTreeEmptyFolderName = { fg = c.comment },
		NvimTreeExecFile = { fg = c.green, style = "bold,underline" },
		NvimTreeSpecialFile = { "Special" },
		-- NvimTreeImageFile = {},
		NvimTreeMarkdownFile = { fg = c.red },

		NvimTreeLicenseIcon = { fg = c.yellow },
		NvimTreeYamlIcon = { fg = c.yellow },
		NvimTreeTomlIcon = { fg = c.yellow },
		NvimTreeGitignoreIcon = { fg = c.red },
		NvimTreeJsonIcon = { fg = c.green },

		NvimTreeLuaIcon = { fg = c.blue },
		NvimTreePythonIcon = { fg = c.yellow },
		NvimTreeShellIcon = { fg = c.fg },
		NvimTreeCIcon = { fg = c.blue },
		NvimTreeReactIcon = { fg = c.blue },
		NvimTreeHtmlIcon = { fg = c.red },
		NvimTreeRustIcon = { fg = c.fg },
		NvimTreeTypescriptIcon = { fg = c.blue },
		NvimTreeVimIcon = { fg = c.green },
		NvimTreeJavascriptIcon = { fg = c.yellow },

		NvimTreeGitDirty = { fg = c.red },
		NvimTreeGitStaged = { fg = c.yellow },
		NvimTreeGitMerge = { fg = c.cyan },
		NvimTreeGitRenamed = { fg = c.yellow },
		NvimTreeGitNew = { fg = c.purple },

		-- Startify
		StartifyBracket = { fg = c.fg },
		StartifyFile = { fg = c.purple, style = "bold" },
		StartifyFooter = { fg = c.fg },
		StartifyHeader = { fg = c.green },
		StartifyNumber = { fg = c.yellow },
		StartifyPath = { fg = c.gray },
		StartifySection = { fg = c.blue, style = "bold,italic" },
		StartifySelect = { fg = c.cyan },
		StartifySlash = { fg = c.gray },
		StartifySpecial = { fg = c.red },

		-- Telescope
		TelescopeSelection = { fg = c.purple },
		TelescopeSelectionCaret = { fg = c.purple },
		TelescopeMultiSelection = { fg = c.comment },
		TelescopeNormal = { fg = c.fg },
		TelescopeBorder = { fg = c.comment },
		TelescopePromptBorder = { "TelescopeBorder" },
		TelescopePreviewBorder = { "TelescopeBorder" },
		TelescopeMatching = { fg = c.green, style = "underline" },
		TelescopePromptPrefix = { fg = c.purple },
		TelescopePrompt = { "TelescopeNormal" },

		-- Trouble.nvim
		TroubleCount = { bg = c.fg, fg = c.bg, style = "bold" },
		TroubleFile = { fg = c.cyan },
		TroubleFoldIcon = { fg = c.fg },
		TroubleLocation = { fg = c.cyan },

		-- Toggleterm
		ToggleTerm = { bg = c.bg, fg = c.fg },
		ToggleTermBorder = { fg = c.gray },

		-- Ultest
		UltestPass = { fg = c.green },
		UltestFail = { fg = c.red },
		UltestRunning = { fg = c.yellow },
		UltestBorder = { fg = c.comment },
		UltestInfo = { fg = c.purple, style = "bold" },
	}

	return theme
end

return M
