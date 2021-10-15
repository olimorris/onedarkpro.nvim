local M = {}

function M.apply(colors, config)
	local config = config or require("onedark.config").options
	local colors = colors or require("onedark.colors").load()

	local theme = {}
	theme.config = config
	theme.colors = colors
	local c = theme.colors

	theme.bold = config.options.bold and "bold" or "NONE"
	theme.italic = config.options.italic and "italic" or "NONE"
	theme.underline = config.options.underline and "underline" or "NONE"
	theme.undercurl = config.options.undercurl and "undercurl" or "NONE"
	theme.bold_italic = (theme.bold ~= "NONE" and theme.italic ~= "NONE") and "bold,italic" or "NONE"

	theme.groups = {
		ColorColumn = { bg = c.color_column }, -- used for the columns set with 'colorcolumn'
		Comment = { fg = c.comment, style = config.styles.comments }, -- Comments
		-- Conceal      = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = c.blue, fg = c.bg }, -- character under the cursor
		-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     = {bg = c.red}, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = c.gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = c.cursorline }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLineNr = { bg = c.cursorline, fg = c.purple, style = theme.bold }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		Directory = { fg = c.blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = c.green, fg = c.black }, -- diff mode: Added line |diff.txt|
		DiffChange = { fg = c.yellow, style = theme.underline }, -- diff mode: Changed line |diff.txt|
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
		LineNr = { link = "Folded" }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		MatchParen = { fg = c.cyan, style = theme.underline }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { link = "ModeMsg" }, -- Area for messages and cmdline
		MsgSeparator = { link = "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = c.green }, -- |more-prompt|
		NonText = { fg = c.gray }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { bg = c.bg, fg = c.fg }, -- normal text
		NormalFloat = { link = "Normal" }, -- Normal text in floating windows.
		FloatBorder = { link = "Folded" },
		NormalNC = { link = "Normal" }, -- normal text in non-current windows
		Pmenu = { bg = c.menu }, -- Popup menu: normal item.
		PmenuSel = { bg = c.blue, fg = c.bg }, -- Popup menu: selected item.
		PmenuSbar = { bg = c.menu_scroll }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = c.menu_scroll_thumb }, -- Popup menu: Thumb of the scrollbar.
		Question = { link = "Folded" }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = c.cursorline }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = c.gray }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		-- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { bg = c.bg, fg = c.fg }, -- status line of current window
		StatusLineNC = { bg = c.bg, fg = c.fg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = c.bg }, -- tab pages line, not active tab page label
		TabLineFill = { bg = c.bg, fg = c.fg }, -- tab pages line, where there are no labels
		TabLineSel = { bg = c.comment, fg = c.purple }, -- tab pages line, active tab page label
		Title = { fg = c.green }, -- titles for output from ":set all", ":autocmd" etc.
		VertSplit = { link = "Folded" }, -- the column separating vertically split windows
		Visual = { bg = c.selection }, -- Visual mode selection
		VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = c.yellow }, -- warning messages
		Whitespace = { fg = c.comment }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = c.blue, fg = c.black }, -- current match in 'wildmenu' completion

		-- Syntax groups
		Constant = { fg = c.cyan }, -- (preferred) any constant
		String = { fg = c.green, style = config.styles.strings }, --   a string constant: "this is a string"
		Character = { fg = c.green }, -- a character constant: 'c', '\n'
		Number = { fg = c.orange }, -- a number constant: 234, 0xff
		Boolean = { fg = c.orange }, -- a boolean constant: TRUE, false
		Float = { fg = c.orange }, -- a floating point constant: 2.3e10

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
		SpecialChar = { fg = c.orange }, -- special character in a constant
		-- Tag = {}, -- you can use CTRL-] on this
		Delimiter = { fg = c.fg }, -- character that needs attention
		SpecialComment = { fg = c.comment }, -- special things inside a comment
		--     Debug = {}, -- debugging statements

		Underlined = { style = theme.underline }, -- (preferred) text that stands out, HTML links
		Bold = { style = theme.bold },
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
		Italic = { style = theme.italic },
		Error = { fg = c.red }, -- (preferred) any erroneous construct
		Todo = { fg = c.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- LSP
		LspDiagnosticsDefaultError = { fg = c.red },
		LspDiagnosticsDefaultWarning = { fg = c.yellow },
		LspDiagnosticsDefaultInformation = { fg = c.blue },
		LspDiagnosticsDefaultHint = { fg = c.cyan },

		LspDiagnosticsSignError = { link = "LspDiagnosticsDefaultError" },
		LspDiagnosticsSignWarning = { link = "LspDiagnosticsDefaultWarning" },
		LspDiagnosticsSignInformation = { link = "LspDiagnosticsDefaultInformation" },
		LspDiagnosticsSignHint = { link = "LspDiagnosticsDefaultHint" },

		LspDiagnosticsUnderlineError = { fg = c.red, style = theme.undercurl },
		LspDiagnosticsUnderlineWarning = { fg = c.yellow, style = theme.undercurl },
		LspDiagnosticsUnderlineInformation = { fg = c.blue, style = theme.undercurl },
		LspDiagnosticsUnderlineHint = { style = theme.undercurl },

		LspDiagnosticsVirtualTextError = { link = "LspDiagnosticsDefaultError" },
		LspDiagnosticsVirtualTextWarning = { link = "LspDiagnosticsDefaultWarning" },
		LspDiagnosticsVirtualTextInformation = { link = "LspDiagnosticsDefaultInformation" },
		LspDiagnosticsVirtualTextHint = { link = "LspDiagnosticsDefaultHint" },

		LspReferenceText = { bg = c.selection }, -- used for highlighting "text" references
		LspReferenceRead = { link = "LspReferenceText" }, -- used for highlighting "read" references
		LspReferenceWrite = { link = "LspReferenceText" }, -- used for highlighting "write" references

		-- TreeSitter
		-- https://github.com/nvim-treesitter/nvim-treesitter/blob/fb5d6e04a87863d01a45dab2cbafec4e2a74822b/doc/nvim-treesitter.txt
		TSAnnotation = { fg = c.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		TSAttribute = { fg = c.purple }, -- (unstable)
		TSBoolean = { fg = c.yellow }, -- For booleans.
		TSCharacter = { fg = c.green }, -- For characters.
		TSComment = { link = "Comment" }, -- For comment blocks.
		TSConditional = { fg = c.purple, style = theme.italic }, -- For keywords related to conditionnals.
		TSConstant = { fg = c.yellow }, -- For constants
		TSConstMacro = { fg = c.yellow }, -- For constants that are defined by macros: `NULL` in C.
		TSConstBuiltin = { fg = c.orange }, -- For constant that are built in the language: `nil` in Lua.
		TSConstructor = { fg = c.cyan }, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
		TSError = { fg = c.red }, -- For syntax/parser errors.
		TSException = { fg = c.green }, -- For exception related keywords.
		TSField = { fg = c.red }, -- For fields.
		TSFloat = { fg = c.yellow }, -- For floats.
		TSFunction = { fg = c.blue, style = config.styles.functions }, -- For function (calls and definitions).
		TSFuncBuiltin = { fg = c.blue }, -- For builtin functions: `table.insert` in Lua.
		TSFuncMacro = { fg = c.cyan }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = c.purple, style = theme.italic }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSKeyword = { fg = c.purple, style = config.styles.keywords }, -- For keywords that don't fall in previous categories.
		TSKeywordFunction = { link = "TSKeyword" }, -- For keywords used to define a fuction.
		TSKeywordOperator = { fg = c.red }, -- For operators that are English words, e.g. `and`, `as`, `or`.
		TSKeywordReturn = { link = "TSKeyword" }, -- for the `return` and `yield` keywords.
		TSLabel = { fg = c.purple, style = theme.italic }, -- For labels: `label:` in C and `:label:` in Lua.
		TSMethod = { fg = c.blue }, -- For method calls and definitions.
		TSNamespace = { fg = c.purple }, -- For identifiers referring to modules and namespaces.
		-- TSNone = {},
		TSNumber = { fg = c.yellow }, -- For integers.
		TSOperator = { fg = c.cyan }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = c.yellow, style = theme.italic }, -- For parameters of a function.
		TSParameterReference = { fg = c.yellow }, -- For references to parameters of a function.
		TSProperty = { fg = c.red }, -- Same as `TSField`.
		TSPunctDelimiter = { fg = c.fg }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = c.red }, -- For brackets and parens.
		TSPunctSpecial = { fg = c.fg }, -- For special punctutation that does not fall in the catagories before.
		TSRepeat = { fg = c.purple, style = theme.italic }, -- For keywords related to loops.
		TSString = { fg = c.green, style = config.styles.strings }, -- For strings.
		TSStringRegex = { fg = c.green, style = config.styles.strings }, -- For regexes.
		TSStringEscape = { fg = c.cyan, style = config.styles.strings }, -- For escape characters within a string.
		TSStringSpecial = { link = "Special" }, -- For strings with special meaning that don't fit into the above categories.
		TSSymbol = { fg = c.red }, -- For identifiers referring to symbols or atoms.
		TSTag = { fg = c.red }, -- Tags like html tag names.
		TSTagAttribute = { link = "TSProperty" }, -- For html tag attributes.
		TSTagDelimiter = { link = "Delimiter" }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = c.fg }, -- For strings considered text in a markup language.
		TSStrong = { fg = c.yellow, style = theme.bold }, -- For text to be represented with strong.
		TSEmphasis = { fg = c.yellow, style = theme.italic }, -- For text to be represented with emphasis.
		TSUnderline = { fg = c.yellow, style = theme.underline }, -- For text to be represented with an underline.
		TSStrike = { fg = c.fg }, -- For strikethrough text.
		TSTitle = { fg = c.yellow }, -- Text that is part of a title.
		TSLiteral = { fg = c.yellow }, -- Literal text.
		TSURI = { fg = c.blue }, -- Any URI like a link or email.
		TSMath = { fg = c.fg }, -- For LaTex-like math environments.
		TSTextReference = { link = "TSText" }, -- For footnotes, text references, citations.
		TSEnvironment = { link = "Macro" }, -- For text environments of markup languages.
		TSEnvironmentName = { link = "Type" }, -- For the name/the string indicating the type of text environment.
		TSNote = { fg = c.fg }, -- Text representation of an informational note.
		TSWarning = { fg = c.yellow }, -- Text representation of a warning note.
		TSDanger = { fg = c.red }, -- Text representation of a danger note.
		TSType = { fg = c.yellow }, -- For types.
		TSVariable = { style = config.styles.variables }, -- Any variable name that does not have another highlight.
		TSTypeBuiltin = { fg = c.orange }, -- For builtin types (you guessed it, right ?).
		TSVariableBuiltin = { fg = c.yellow, style = theme.italic }, -- Variable names that are defined by the languages, like `this` or `self`.

		-- CSS
		cssAttrComma = { fg = c.purple },
		cssAttributeSelector = { fg = c.green },
		cssBraces = { fg = c.red },
		cssClassName = { fg = c.orange },
		cssClassNameDot = { fg = c.orange },
		cssDefinition = { fg = c.purple, style = theme.bold_italic },
		cssFontAttr = { fg = c.orange },
		cssFontDescriptor = { link = "cssDefinition" },
		cssFunctionName = { fg = c.blue },
		cssIdentifier = { fg = c.blue },
		cssImportant = { link = "cssDefinition" },
		cssInclude = { fg = c.fg },
		cssIncludeKeyword = { link = "cssDefinition" },
		cssMediaType = { fg = c.orange },
		cssProp = { fg = c.fg },
		cssPseudoClassId = { fg = c.orange },
		cssSelectorOp = { link = "cssDefinition" },
		cssSelectorOp2 = { link = "cssDefinition" },
		cssTagName = { fg = c.red },

		-- Git
		diffAdded = { fg = c.green },
		diffChanged = { fg = c.yellow },
		diffRemoved = { fg = c.red },
		diffFile = { fg = c.yellow },
		diffNewFile = { fg = c.yellow },
		diffLine = { fg = c.blue },
		GitGutterAdd = { link = "diffAdded" },
		GitGutterChange = { link = "diffChanged" },
		GitGutterDelete = { link = "diffRemoved" },
		GitGutterChangeDelete = { link = "diffRemoved" },

		-- HTML
		htmlArg = { fg = c.purple, style = theme.bold_italic },
		htmlBold = { fg = c.orange, style = theme.bold },
		htmlItalic = { fg = c.purple, style = theme.italic },
		htmlLink = { fg = c.cyan, style = theme.underline },
		htmlH1 = { fg = c.red },
		htmlH2 = { link = "htmlH1" },
		htmlH3 = { link = "htmlH1" },
		htmlH4 = { link = "htmlH1" },
		htmlH5 = { link = "htmlH1" },
		htmlH6 = { link = "htmlH1" },
		htmlSpecialChar = { link = "SpecialChar" },
		htmlSpecialTagName = { fg = c.red },
		htmlTag = { link = "TSTag" },
		htmlEndTag = { link = "htmlTag" },
		htmlTagN = { fg = c.red },
		htmlTagName = { fg = c.red },
		htmlTitle = { fg = c.fg },

		-- Javascript
		javascriptBraces = { fg = c.red },
		javaScriptFunction = { fg = c.purple },
		javaScriptIdentifier = { fg = c.purple },
		javaScriptNull = { fg = c.orange },
		javaScriptNumber = { link = "Number" },
		javaScriptRequire = { fg = c.cyan },
		javaScriptReserved = { fg = c.purple },
		---- https://github.com/pangloss/vim-javascript included in Vim-Polygot
		jsArrowFunction = { fg = c.purple, style = theme.bold_italic },
		jsClassKeyword = { link = "jsArrowFunction" },
		jsClassMethodType = { link = "jsArrowFunction" },
		jsDocParam = { fg = c.blue },
		jsDocTags = { fg = c.purple },
		jsExport = { link = "jsArrowFunction" },
		jsExportDefault = { link = "jsExport" },
		jsExtendsKeyword = { link = "jsClassKeyword" },
		jsFrom = { link = "jsExport" },
		jsFuncCall = { fg = c.blue },
		jsFunction = { link = "jsArrowFunction" },
		jsGenerator = { fg = c.yellow },
		jsGlobalObjects = { link = "jsGenerator" },
		jsImport = { link = "jsExport" },
		jsModuleAs = { link = "jsExport" },
		jsModuleWords = { link = "jsExport" },
		jsModules = { link = "jsExport" },
		jsNull = { fg = c.orange },
		jsOperator = { fg = c.purple },
		jsStorageClass = { link = "jsClassKeyword" },
		jsSuper = { fg = c.red },
		jsTemplateBraces = { fg = c.red },
		jsTemplateVar = { fg = c.green },
		jsThis = { fg = c.red },
		jsUndefined = { fg = c.orange },

		-- JSON
		jsonCommentError = { fg = c.fg },
		jsonKeyword = { fg = c.red },
		jsonBoolean = { link = "Boolean" },
		jsonNumber = { link = "Number" },
		jsonQuote = { fg = c.fg },
		jsonMissingCommaError = { fg = c.red, style = "reverse" },
		jsonNoQuotesError = { link = "jsonMissingCommaError" },
		jsonNumError = { link = "jsonMissingCommaError" },
		jsonString = { fg = c.green },
		jsonStringSQError = { link = "jsonMissingCommaError" },
		jsonSemicolonError = { link = "jsonMissingCommaError" },

		-- Markdown
		markdownBlockquote = { fg = c.comment },
		markdownBold = { fg = c.orange, style = theme.bold },
		markdownCode = { fg = c.green },
		markdownCodeBlock = { link = "markdownCode" },
		markdownCodeDelimiter = { link = "markdownCode" },
		markdownH1 = { fg = c.red },
		markdownH2 = { link = "markdownH1" },
		markdownH3 = { link = "markdownH1" },
		markdownH4 = { link = "markdownH1" },
		markdownH5 = { link = "markdownH1" },
		markdownH6 = { link = "markdownH1" },
		markdownHeadingDelimiter = { fg = c.red },
		markdownHeadingRule = { link = "markdownBlockquote" },
		markdownId = { fg = c.purple, style = theme.bold_italic },
		markdownIdDeclaration = { fg = c.blue },
		markdownIdDelimiter = { link = "markdownId" },
		markdownItalic = { fg = c.purple, style = theme.italic },
		markdownLinkDelimiter = { fg = c.purple },
		markdownLinkText = { fg = c.blue },
		markdownListMarker = { fg = c.red },
		markdownOrderedListMarker = { link = "markdownListMarker" },
		markdownRule = { link = "markdownBlockquote" },
		markdownUrl = { fg = c.cyan, style = theme.underline },

		-- Python
		pythonNone = { fg = c.yellow },
		pythonBoolean = { link = "pythonNone" },
		pythonClass = { fg = c.yellow },
		pythonParens = { fg = c.red },
		pythonBuiltinObj = { fg = c.cyan, style = theme.bold },
		pythonSpaceError = { bg = c.red, fg = c.fg },
		pythonString = { fg = c.green },
		pythonDot = { fg = c.fg },
		pythonImport = { fg = c.purple, style = theme.bold_italic },
		pythonRepeat = { link = "pythonImport" },
		pythonStatement = { link = "pythonImport" },
		pythonOperator = { link = "pythonImport" },

		-- Ruby
		rubyBlockParameter = { fg = c.red },
		rubyBlockParameterList = { link = "rubyBlockParameter" },
		rubyClass = { fg = c.purple, style = theme.bold_italic },
		rubyConstant = { fg = c.yellow },
		rubyControl = { link = "rubyClass" },
		rubyEscape = { fg = c.red },
		rubyFunction = { fg = c.blue },
		rubyGlobalVariable = { fg = c.red },
		rubyInclude = { fg = c.blue },
		rubyIncluderubyGlobalVariable = { link = "rubyGlobalVariable" },
		rubyInstanceVariable = { link = "rubyGlobalVariable" },
		rubyInterpolation = { fg = c.cyan },
		rubyInterpolationDelimiter = { fg = c.red },
		rubyRegexp = { fg = c.cyan },
		rubyRegexpDelimiter = { link = "rubyRegexp" },
		rubyStringDelimiter = { fg = c.green },
		rubySymbol = { fg = c.cyan },

		-- SASS
		sassidChar = { fg = c.red },
		sassClassChar = { fg = c.orange },
		sassInclude = { fg = c.purple, style = theme.bold_italic },
		sassMixing = { link = "sassInclude" },
		sassMixinName = { fg = c.blue },
		scssExtend = { link = "sassInclude" },
		scssImport = { link = "sassInclude" },
		scssMixin = { link = "sassMixing" },
		scssSelectorName = { fg = c.orange },
		scssVariable = { link = "sassMixing" },

		-- Barbar.nvim
		BufferCurrent = { fg = c.purple, bg = c.bg },
		BufferCurrentIndex = { link = "BufferCurrent" },
		BufferCurrentMod = { fg = c.purple },
		BufferCurrentSign = { link = "BufferCurrentMod" },
		BufferCurrentIcon = { link = "BufferCurrentMod" },
		BufferCurrentTarget = { bg = c.bg, fg = c.blue, style = theme.bold },
		BufferVisible = { fg = c.gray },
		BufferVisibleIndex = { link = "BufferVisible" },
		BufferVisibleMod = { link = "BufferVisible" },
		BufferVisibleSign = { link = "BufferVisibleMod" },
		BufferVisibleIcon = { link = "BufferVisibleMod" },
		BufferVisibleTarget = { link = "BufferCurrentTarget" },
		BufferInactive = { link = "BufferVisible" }, -- Buffer which is not active
		BufferInactiveIndex = { link = "BufferInactive" },
		BufferInactiveMod = { link = "BufferInactive" },
		BufferInactiveSign = { fg = c.bg }, -- The inactive sign of a buffer
		BufferInactiveTarget = { link = "BufferCurrentTarget" },
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
		DapUIBreakpointsCurrentLine = { fg = c.yellow, style = theme.bold },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
		DapUIWatchesEmpty = { bg = c.red, fg = c.bg },
		DapUIWatchesValue = { fg = c.red },
		DapUIWatchesError = { fg = c.red },

		-- Dashboard
		-- dashboardHeader = {},
		dashboardCenter = { fg = c.purple, style = theme.bold },
		dashboardFooter = { fg = c.blue },
		--dashboardShortCut = {},

		-- hlslens
		HlSearchNear = { bg = c.highlight, fg = c.bg },
		HlSearchLens = { bg = c.gray },
		HlSearchLensNear = { link = "HlSearchNear" },
		HlSearchFloat = { link = "HlSearchNear" },

		-- Indentline
		IndentLine = { fg = c.indentline },
		IndentBlanklineChar = { link = "IndentLine" },
		IndentBlanklineSpaceChar = { link = "IndentLine" },
		IndentBlanklineSpaceCharBlankline = { link = "IndentLine" },
		IndentBlanklineContextChar = { link = "IndentLine" },

		-- LSP Saga
		LspSagaDiagnosticBorder = { link = "NormalNC" },
		LspSagaDiagnosticHeader = { fg = c.purple },
		LspSagaDiagnosticTruncateLine = { link = "NormalNC" },
		LspFloatWinBorder = { link = "NormalNC" },
		LspSagaBorderTitle = { link = "Title" },
		TargetWord = { link = "Error" },
		ReferencesCount = { link = "Title" },
		ReferencesIcon = { link = "Special" },
		DefinitionCount = { link = "Title" },
		TargetFileName = { fg = c.comment },
		DefinitionIcon = { link = "Special" },
		ProviderTruncateLine = { link = "NormalNC" },
		SagaShadow = {},
		LspSagaFinderSelection = { link = "Search" },
		DiagnosticTruncateLine = { link = "NormalNC" },
		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticWarning = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticInformation = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
		DefinitionPreviewTitle = { link = "Title" },
		LspSagaShTruncateLine = { link = "NormalNC" },
		LspSagaDocTruncateLine = { link = "NormalNC" },
		LineDiagTuncateLine = { link = "NormalNC" },
		LspSagaCodeActionTitle = { link = "Title" },
		LspSagaCodeActionTruncateLine = { link = "NormalNC" },
		LspSagaCodeActionContent = { link = "Normal" },
		LspSagaRenamePromptPrefix = { fg = c.purple },
		LspSagaRenameBorder = { style = theme.bold },
		LspSagaHoverBorder = { style = theme.bold },
		LspSagaSignatureHelpBorder = { style = theme.bold },
		LspSagaCodeActionBorder = { style = theme.bold },
		LspSagaAutoPreview = {},
		LspSagaDefPreviewBorder = { style = theme.bold },
		LspLinesDiagBorder = { style = theme.bold },

		--Marks.nvim
		MarksSignHL = { bg = c.red, fg = c.bg },
		MarkNumSignHL = { bg = c.red, fg = c.bg },
		MarkVirtTextHL = { bg = c.purple, fg = c.bg },

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
		DebugBreakpointLine = { fg = c.red, style = theme.underline },
		DebugHighlight = { fg = c.blue },
		DebugHighlightLine = { fg = c.purple, style = theme.italic },
		NvimDapVirtualText = { fg = c.cyan, style = theme.italic },

		--nvim-tree
		NvimTreeNormalNC = { bg = c.color_column }, -- Color when nvim-tree is no longer in focus

		NvimTreeSymlink = { fg = c.cyan, style = theme.underline },
		NvimTreeFolderName = { fg = c.blue },
		NvimTreeRootFolder = { fg = c.purple, style = theme.bold },
		NvimTreeFolderIcon = { fg = c.purple },
		NvimTreeEmptyFolderName = { fg = c.comment },
		NvimTreeOpenedFolderName = { fg = c.purple },
		NvimTreeExecFile = { fg = c.green, style = theme.bold },
		NvimTreeOpenedFile = { fg = c.purple, style = theme.italic },
		NvimTreeSpecialFile = { link = "Special" },
		-- NvimTreeImageFile = {},
		NvimTreeMarkdownFile = { fg = c.red },
		NvimTreeIndentMarker = { fg = c.gray },

		NvimTreeLicenseIcon = { fg = c.yellow },
		NvimTreeYamlIcon = { fg = c.yellow },
		NvimTreeTomlIcon = { fg = c.yellow },
		NvimTreeGitignoreIcon = { fg = c.red },
		NvimTreeJsonIcon = { fg = c.green },

		NvimTreeLuaIcon = { fg = c.blue },
		NvimTreePythonIcon = { fg = c.yellow },
		NvimTreeShellIcon = { fg = c.fg },
		NvimTreeJavascriptIcon = { fg = c.yellow },
		NvimTreeCIcon = { fg = c.blue },
		NvimTreeReactIcon = { fg = c.blue },
		NvimTreeHtmlIcon = { fg = c.red },
		NvimTreeRustIcon = { fg = c.fg },
		NvimTreeTypescriptIcon = { fg = c.blue },
		NvimTreeVimIcon = { fg = c.green },

		NvimTreeGitDirty = { fg = c.red },
		NvimTreeGitStaged = { fg = c.yellow },
		NvimTreeGitMerge = { fg = c.cyan },
		NvimTreeGitRenamed = { fg = c.yellow },
		NvimTreeGitNew = { fg = c.green },
		NvimTreeGitDeleted = { fg = c.red },

		-- Startify
		StartifyBracket = { fg = c.fg },
		StartifyFile = { fg = c.purple, style = theme.bold },
		StartifyFooter = { fg = c.fg },
		StartifyHeader = { fg = c.green },
		StartifyNumber = { fg = c.yellow },
		StartifyPath = { fg = c.gray },
		StartifySection = { fg = c.blue, style = theme.bold_italic },
		StartifySelect = { fg = c.cyan },
		StartifySlash = { fg = c.gray },
		StartifySpecial = { fg = c.red },

		-- Telescope
		TelescopeSelection = { bg = c.cursorline, fg = c.purple },
		TelescopeSelectionCaret = { fg = c.purple },
		TelescopeMultiSelection = { bg = c.cursorline, fg = c.comment },
		TelescopeNormal = { fg = c.fg },
		TelescopeBorder = { fg = c.comment },
		TelescopePromptBorder = { link = "TelescopeBorder" },
		TelescopePreviewBorder = { link = "TelescopeBorder" },
		TelescopeMatching = { fg = c.green, style = theme.underline },
		TelescopePromptPrefix = { fg = c.purple },
		TelescopePrompt = { link = "TelescopeNormal" },

		-- Trouble.nvim
		TroubleCount = { fg = c.purple, style = theme.bold },
		TroubleFile = { bg = "NONE", fg = c.cyan },
		TroubleFoldIcon = { bg = "NONE", fg = c.fg },
		TroubleLocation = { bg = "NONE", fg = c.cyan },

		-- Toggleterm
		ToggleTerm = { bg = c.bg, fg = c.fg },
		ToggleTermBorder = { fg = c.gray },

		-- Ultest
		UltestPass = { fg = c.green },
		UltestFail = { fg = c.red },
		UltestRunning = { fg = c.yellow },
		UltestBorder = { fg = c.comment },
		UltestInfo = { fg = c.purple, style = theme.bold },
	}

	return theme
end

return M
