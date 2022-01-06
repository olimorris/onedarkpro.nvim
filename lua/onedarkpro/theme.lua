local M = {}
local theme = {}

---Apply the colors and the config file to the theme's highlight groups
---@return table theme
local function default_hlgroups()
	return {
		ColorColumn = { bg = theme.colors.color_column }, -- used for the columns set with 'colorcolumn'
		Comment = { fg = theme.colors.comment, style = theme.config.styles.comments }, -- Comments
		-- Conceal      = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = theme.colors.black, fg = theme.colors.bg }, -- character under the cursor
		-- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     = {bg = theme.colors.red}, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = theme.colors.gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = theme.options.cursorline }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLineNr = { bg = theme.options.cursorline, fg = theme.colors.purple, style = theme.options.bold }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		Directory = { fg = theme.colors.blue }, -- directory names (and other special names in listings)
		DiffAdd = { bg = theme.colors.diff_add_bg }, -- diff mode: Added line |diff.txt|
		DiffChange = { style = theme.options.underline }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = theme.colors.diff_delete_bg },
		DiffText = { bg = theme.colors.diff_text_bg }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = theme.colors.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		TermCursor = { bg = theme.colors.purple }, -- cursor in a focused terminal
		TermCursorNC = { bg = theme.colors.gray }, -- cursor in an unfocused terminal
		ErrorMsg = { fg = theme.colors.red }, -- error messages on the command line
		Folded = { bg = theme.options.transparency, fg = theme.colors.gray }, -- line used for closed folds
		-- FoldColumn = {}, -- 'foldcolumn'
		SignColumn = { bg = theme.options.transparency }, -- column where |signs| are displayed
		IncSearch = { bg = theme.colors.selection, fg = theme.colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute = { bg = theme.colors.yellow, fg = theme.colors.bg }, -- |:substitute| replacement text highlighting
		LineNr = { link = "Folded" }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		MatchParen = { fg = theme.colors.cyan, style = theme.options.underline }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea = { link = "ModeMsg" }, -- Area for messages and cmdline
		MsgSeparator = { link = "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = theme.colors.green }, -- |more-prompt|
		NonText = { link = "Folded" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { bg = theme.options.transparency, fg = theme.colors.fg }, -- normal text
		NormalFloat = { link = "Normal" }, -- Normal text in floating windows.
		FloatBorder = { link = "Folded" },
		NormalNC = {
			bg = theme.config.options.transparency and theme.colors.none
				or theme.config.options.window_unfocussed_color and theme.colors.color_column
				or theme.colors.bg,
			fg = theme.colors.fg,
		}, -- normal text in non-current windows
		Pmenu = { bg = theme.colors.menu }, -- Popup menu: normal item.
		PmenuSel = { bg = theme.colors.blue, fg = theme.colors.bg }, -- Popup menu: selected item.
		PmenuSbar = { bg = theme.colors.menu_scroll }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = theme.colors.menu_scroll_thumb }, -- Popup menu: Thumb of the scrollbar.
		Question = { link = "Folded" }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { bg = theme.options.cursorline }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { bg = theme.colors.gray, style = theme.options.underline }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		-- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { bg = theme.options.transparency, fg = theme.colors.fg }, -- status line of current window
		StatusLineNC = {
			bg = theme.config.options.transparency and theme.colors.none
				or theme.config.options.window_unfocussed_color and theme.colors.color_column
				or theme.colors.bg,
			fg = theme.colors.fg,
		}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine = { bg = theme.options.transparency }, -- tab pages line, not active tab page label
		TabLineFill = { bg = theme.options.transparency, fg = theme.colors.fg }, -- tab pages line, where there are no labels
		TabLineSel = { bg = theme.colors.comment, fg = theme.colors.purple }, -- tab pages line, active tab page label
		Title = { fg = theme.colors.green }, -- titles for output from ":set all", ":autocmd" ettheme.colors.
		VertSplit = { link = "Folded" }, -- the column separating vertically split windows
		Visual = { bg = theme.colors.selection }, -- Visual mode selection
		VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = theme.colors.yellow }, -- warning messages
		Whitespace = { fg = theme.colors.comment }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { bg = theme.colors.blue, fg = theme.colors.black }, -- current match in 'wildmenu' completion

		-- Syntax groups
		Constant = { fg = theme.colors.cyan }, -- (preferred) any constant
		String = { fg = theme.colors.green, style = theme.config.styles.strings }, --   a string constant: "this is a string"
		Character = { fg = theme.colors.green }, -- a character constant: 'c', '\n'
		Number = { fg = theme.colors.orange }, -- a number constant: 234, 0xff
		Boolean = { fg = theme.colors.orange }, -- a boolean constant: TRUE, false
		Float = { fg = theme.colors.orange }, -- a floating point constant: 2.3e10

		Identifier = { fg = theme.colors.fg, style = theme.config.styles.variables }, -- (preferred) any variable name
		Function = { fg = theme.colors.yellow, style = theme.config.styles.functions }, -- function name (also: methods for classes)

		Statement = { fg = theme.colors.purple }, -- (preferred) any statement
		Conditional = { fg = theme.colors.purple, style = theme.options.italic }, --  if, then, else, endif, switch, ettheme.colors.
		Repeat = { fg = theme.colors.purple }, -- for, do, while, ettheme.colors.
		Label = { fg = theme.colors.red }, -- case, default, ettheme.colors.
		Operator = { fg = theme.colors.cyan, style = theme.options.italic }, -- "sizeof", "+", "*", ettheme.colors.
		Keyword = { fg = theme.colors.purple, style = theme.config.styles.keywords }, -- any other keyword
		Exception = { fg = theme.colors.purple }, -- try, catch, throw

		PreProc = { fg = theme.colors.yellow }, -- (preferred) generic Preprocessor
		Include = { fg = theme.colors.blue }, -- preprocessor #include
		Define = { fg = theme.colors.purple }, -- preprocessor #define
		Macro = { fg = theme.colors.purple }, -- same as Define
		PreCondit = { fg = theme.colors.yellow }, -- preprocessor #if, #else, #endif, ettheme.colors.

		Type = { fg = theme.colors.yellow }, -- (preferred) int, long, char, ettheme.colors.
		StorageClass = { fg = theme.colors.yellow }, -- static, register, volatile, ettheme.colors.
		Structure = { fg = theme.colors.yellow }, -- struct, union, enum, ettheme.colors.
		Typedef = { fg = theme.colors.yellow }, -- A typedef

		Special = { fg = theme.colors.blue }, -- (preferred) any special symbol
		SpecialChar = { fg = theme.colors.orange }, -- special character in a constant
		-- Tag = {}, -- you can use CTRL-] on this
		Delimiter = { fg = theme.colors.fg }, -- character that needs attention
		SpecialComment = { fg = theme.colors.comment }, -- special things inside a comment
		--     Debug = {}, -- debugging statements

		Underlined = { style = theme.options.underline }, -- (preferred) text that stands out, HTML links
		Bold = { style = theme.options.bold },
		-- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|
		Italic = { style = theme.options.italic },
		Error = { fg = theme.colors.red }, -- (preferred) any erroneous construct
		Todo = { fg = theme.colors.purple }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Git
		diffAdded = { fg = theme.colors.green },
		diffChanged = { fg = theme.colors.yellow },
		diffRemoved = { fg = theme.colors.red },
		diffFile = { fg = theme.colors.yellow },
		diffNewFile = { fg = theme.colors.yellow },
		diffLine = { fg = theme.colors.blue },
		GitGutterAdd = { link = "diffAdded" },
		GitGutterChange = { link = "diffChanged" },
		GitGutterDelete = { link = "diffRemoved" },
		GitGutterChangeDelete = { link = "diffRemoved" },

		-- Plugins
		-- Aerial.nvim
		AerialClass = { fg = theme.colors.purple, style = theme.options.bold_italic },

		-- Barbar.nvim
		BufferCurrent = { fg = theme.colors.purple, bg = theme.options.transparency },
		BufferCurrentIndex = { link = "BufferCurrent" },
		BufferCurrentMod = { fg = theme.colors.purple },
		BufferCurrentSign = { link = "BufferCurrentMod" },
		BufferCurrentIcon = { link = "BufferCurrentMod" },
		BufferCurrentTarget = { bg = theme.options.transparency, fg = theme.colors.blue, style = theme.options.bold },
		BufferVisible = { fg = theme.colors.gray },
		BufferVisibleIndex = { link = "BufferVisible" },
		BufferVisibleMod = { link = "BufferVisible" },
		BufferVisibleSign = { link = "BufferVisibleMod" },
		BufferVisibleIcon = { link = "BufferVisibleMod" },
		BufferVisibleTarget = { link = "BufferCurrentTarget" },
		BufferInactive = { link = "BufferVisible" }, -- Buffer which is not active
		BufferInactiveIndex = { link = "BufferInactive" },
		BufferInactiveMod = { link = "BufferInactive" },
		BufferInactiveSign = { fg = theme.colors.bg }, -- The inactive sign of a buffer
		BufferInactiveTarget = { link = "BufferCurrentTarget" },
		BufferTabpages = { fg = theme.colors.purple }, -- The tab page indicator on the right
		BufferTabpageFill = { fg = theme.colors.bg }, -- The sign which marks the end of the bufferline

		-- Dashboard
		-- dashboardHeader = {},
		dashboardCenter = { fg = theme.colors.purple, style = theme.options.bold },
		dashboardFooter = { fg = theme.colors.blue },
		--dashboardShortCut = {},

		-- Hop.nvim
		-- https://github.com/phaazon/hop.nvim/blob/e3c9fc3ab1e1db6bfb4f19377c53d0e457e0e2e9/doc/hop.txt#L759
		HopNextKey = { bg = theme.colors.green, fg = theme.colors.bg },
		HopNextKey1 = { bg = theme.colors.yellow, fg = theme.colors.bg },
		HopNextKey2 = { link = "HopNextKey1" },
		HopUnmatched = { fg = theme.colors.gray },
		HopCursor = { link = "Cursor" },

		-- Indentline
		-- https://github.com/lukas-reineke/indent-blankline.nvim/blob/caf7f61e94525bbd97e32f118efd6c0722430616/doc/indent_blankline.txt#L31
		IndentLine = { fg = theme.colors.indentline },
		IndentBlanklineChar = { link = "IndentLine" },
		IndentBlanklineSpaceChar = { link = "IndentLine" },
		IndentBlanklineSpaceCharBlankline = { link = "IndentLine" },
		IndentBlanklineContextChar = { fg = theme.colors.purple },
		IndentBlanklineContextStart = { style = "underline" },

		-- LSP Saga
		LspSagaDiagnosticBorder = { link = "NormalNC" },
		LspSagaDiagnosticHeader = { fg = theme.colors.purple },
		LspSagaDiagnosticTruncateLine = { link = "NormalNC" },
		LspFloatWinBorder = { link = "NormalNC" },
		LspSagaBorderTitle = { link = "Title" },
		TargetWord = { link = "Error" },
		ReferencesCount = { link = "Title" },
		ReferencesIcon = { link = "Special" },
		DefinitionCount = { link = "Title" },
		TargetFileName = { fg = theme.colors.comment },
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
		LspSagaRenamePromptPrefix = { fg = theme.colors.purple },
		LspSagaRenameBorder = { style = theme.options.bold },
		LspSagaHoverBorder = { style = theme.options.bold },
		LspSagaSignatureHelpBorder = { style = theme.options.bold },
		LspSagaCodeActionBorder = { style = theme.options.bold },
		LspSagaAutoPreview = {},
		LspSagaDefPreviewBorder = { style = theme.options.bold },
		LspLinesDiagBorder = { style = theme.options.bold },

		-- marks.nvim
		-- https://github.com/chentau/marks.nvim/blob/555e8265989aa13249e76fd229226fb74101f905/doc/marks-nvim.txt#L278
		MarkSignHL = { fg = theme.colors.purple, bg = "NONE", style = theme.options.bold },
		-- MarkSignNumHL = {  },
		MarkVirtTextHL = { fg = theme.colors.gray, style = theme.options.italic },

		-- nvim-cmp
		-- https://github.com/hrsh7th/nvim-cmp#highlights
		-- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/types/lsp.lua#L108
		CmpDocumentation = { fg = theme.colors.fg, bg = theme.colors.menu },
		CmpDocumentationBorder = { fg = theme.colors.fg, bg = theme.colors.menu },

		CmpItemAbbr = { fg = theme.colors.fg },
		CmpItemAbbrMatch = { fg = theme.colors.cyan, style = theme.options.bold_italic },
		CmpItemAbbrMatchFuzzy = { fg = theme.colors.yellow },

		CmpItemMenu = { fg = theme.colors.fg },
		CmpItemKind = { fg = theme.colors.blue },
		CmpItemKindText = { fg = theme.colors.fg },
		CmpItemKindMethod = { fg = theme.colors.blue },
		CmpItemKindFunction = { link = "CmpItemKindMethod" },
		CmpItemKindConstructor = { fg = theme.colors.cyan },
		CmpItemKindField = { fg = theme.colors.fg },
		CmpItemKindVariable = { fg = theme.colors.red },
		CmpItemKindClass = { fg = theme.colors.yellow },
		CmpItemKindInterface = { link = "CmpItemKindClass" },
		-- CmpItemKindModule = {},
		CmpItemKindProperty = { fg = theme.colors.red },
		-- CmpItemKindUnit = {},
		CmpItemKindValue = { fg = theme.colors.orange },
		-- CmpItemKindEnum = {},
		CmpItemKindKeyword = { fg = theme.colors.purple },
		CmpItemKindSnippet = { fg = theme.colors.green },
		-- CmpItemKindVColor = {},
		-- CmpItemKindFile = {},
		-- CmpItemKindReference = {},
		-- CmpItemKindFolder = {},
		-- CmpItemKindEnumMember = {},
		CmpItemKindConstant = { fg = theme.colors.green },
		CmpItemKindStruct = { fg = theme.colors.yellow },
		-- CmpItemKindEvent = {},
		-- CmpItemKindOperator = {},
		-- CmpItemKindTypeParameter = {},

		-- nvim-dap
		DebugBreakpoint = { fg = theme.colors.red },
		DebugBreakpointLine = { fg = theme.colors.red, style = theme.options.underline },
		DebugHighlight = { fg = theme.colors.blue },
		DebugHighlightLine = { fg = theme.colors.purple, style = theme.options.italic },
		NvimDapVirtualText = { fg = theme.colors.cyan, style = theme.options.italic },

		-- nvim-dap-ui
		DapUIScope = { bg = theme.colors.blue, fg = theme.colors.bg },
		DapUIType = { fg = theme.colors.blue },
		DapUIDecoration = { fg = theme.colors.blue },
		DapUIThread = { fg = theme.colors.purple },
		DapUIStoppedThread = { bg = theme.colors.purple, fg = theme.colors.bg },
		DapUIFrameName = { fg = theme.colors.fg },
		DapUISource = { fg = theme.colors.purple },
		DapUIBreakpointsPath = { bg = theme.colors.yellow, fg = theme.colors.bg },
		DapUIBreakpointsInfo = { fg = theme.colors.fg },
		DapUIBreakpointsCurrentLine = { fg = theme.colors.yellow, style = theme.options.bold },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
		DapUIWatchesEmpty = { bg = theme.colors.red, fg = theme.colors.bg },
		DapUIWatchesValue = { fg = theme.colors.red },
		DapUIWatchesError = { fg = theme.colors.red },

		-- nvim-hlslens
		HlSearchNear = { bg = theme.colors.highlight, fg = theme.colors.bg },
		HlSearchLens = { bg = theme.colors.gray },
		HlSearchLensNear = { link = "HlSearchNear" },
		HlSearchFloat = { link = "HlSearchNear" },

		-- nvim-tree
		NvimTreeNormalNC = {
			bg = theme.config.options.window_unfocussed_color and theme.colors.color_column or theme.colors.bg,
		}, -- Color when nvim-tree is no longer in focus

		NvimTreeSymlink = { fg = theme.colors.cyan, style = theme.options.underline },
		NvimTreeFolderName = { fg = theme.colors.blue },
		NvimTreeRootFolder = { fg = theme.colors.purple, style = theme.options.bold },
		NvimTreeFolderIcon = { fg = theme.colors.purple },
		NvimTreeEmptyFolderName = { fg = theme.colors.comment },
		NvimTreeOpenedFolderName = { fg = theme.colors.purple },
		NvimTreeExecFile = { fg = theme.colors.green, style = theme.options.bold },
		NvimTreeOpenedFile = { fg = theme.colors.purple, style = theme.options.italic },
		NvimTreeSpecialFile = { link = "Special" },
		-- NvimTreeImageFile = {},
		NvimTreeMarkdownFile = { fg = theme.colors.red },
		NvimTreeIndentMarker = { fg = theme.colors.gray },

		NvimTreeLicenseIcon = { fg = theme.colors.yellow },
		NvimTreeYamlIcon = { fg = theme.colors.yellow },
		NvimTreeTomlIcon = { fg = theme.colors.yellow },
		NvimTreeGitignoreIcon = { fg = theme.colors.red },
		NvimTreeJsonIcon = { fg = theme.colors.green },

		NvimTreeLuaIcon = { fg = theme.colors.blue },
		NvimTreePythonIcon = { fg = theme.colors.yellow },
		NvimTreeShellIcon = { fg = theme.colors.fg },
		NvimTreeJavascriptIcon = { fg = theme.colors.yellow },
		NvimTreeCIcon = { fg = theme.colors.blue },
		NvimTreeReactIcon = { fg = theme.colors.blue },
		NvimTreeHtmlIcon = { fg = theme.colors.red },
		NvimTreeRustIcon = { fg = theme.colors.fg },
		NvimTreeTypescriptIcon = { fg = theme.colors.blue },
		NvimTreeVimIcon = { fg = theme.colors.green },

		NvimTreeGitDirty = { fg = theme.colors.red },
		NvimTreeGitStaged = { fg = theme.colors.yellow },
		NvimTreeGitMerge = { fg = theme.colors.cyan },
		NvimTreeGitRenamed = { fg = theme.colors.yellow },
		NvimTreeGitNew = { fg = theme.colors.green },
		NvimTreeGitDeleted = { fg = theme.colors.red },

		-- nvim-ts-rainbow
		rainbowcol1 = { fg = theme.colors.red },
		rainbowcol2 = { fg = theme.colors.yellow },
		rainbowcol3 = { fg = theme.colors.orange },
		rainbowcol4 = { fg = theme.colors.green },
		rainbowcol5 = { fg = theme.colors.blue },
		rainbowcol6 = { fg = theme.colors.cyan },
		rainbowcol7 = { fg = theme.colors.purple },

		-- Packer
		packerFail = { fg = theme.colors.red }, -- Icon when install/update fails
		packerSuccess = { fg = theme.colors.green }, -- Icon when install/update is a success
		packerWorking = { fg = theme.colors.yellow }, -- Icon when syncing
		packerOutput = { fg = theme.colors.blue }, -- Text beneath plugin title (e.g. Commits)
		packerStatusFail = { fg = theme.colors.red },
		packerStatusSuccess = { fg = theme.colors.green }, -- Plugin name when install/update is a success

		-- Startify
		StartifyBracket = { fg = theme.colors.fg },
		StartifyFile = { fg = theme.colors.purple, style = theme.options.bold },
		StartifyFooter = { fg = theme.colors.fg },
		StartifyHeader = { fg = theme.colors.green },
		StartifyNumber = { fg = theme.colors.yellow },
		StartifyPath = { fg = theme.colors.gray },
		StartifySection = { fg = theme.colors.blue, style = theme.options.bold_italic },
		StartifySelect = { fg = theme.colors.cyan },
		StartifySlash = { fg = theme.colors.gray },
		StartifySpecial = { fg = theme.colors.red },

		-- Telescope
		TelescopeSelection = { bg = theme.options.cursorline, fg = theme.colors.purple },
		TelescopeSelectionCaret = { fg = theme.colors.purple },
		TelescopeMultiSelection = { bg = theme.options.cursorline, fg = theme.colors.comment },
		TelescopeNormal = { fg = theme.colors.fg },
		TelescopeBorder = { fg = theme.colors.comment },
		TelescopePromptBorder = { link = "TelescopeBorder" },
		TelescopePreviewBorder = { link = "TelescopeBorder" },
		TelescopeMatching = { fg = theme.colors.green, style = theme.options.underline },
		TelescopePromptPrefix = { fg = theme.colors.purple },
		TelescopePrompt = { link = "TelescopeNormal" },

		-- Toggleterm
		ToggleTerm = { bg = theme.options.transparency, fg = theme.colors.fg },
		ToggleTermBorder = { fg = theme.colors.gray },

		-- Trouble.nvim
		TroubleCount = { fg = theme.colors.purple, style = theme.options.bold },
		TroubleFile = { bg = "NONE", fg = theme.colors.cyan },
		TroubleFoldIcon = { bg = "NONE", fg = theme.colors.fg },
		TroubleLocation = { bg = "NONE", fg = theme.colors.cyan },

		-- Ultest
		UltestPass = { fg = theme.colors.green },
		UltestFail = { fg = theme.colors.red },
		UltestRunning = { fg = theme.colors.yellow },
		UltestBorder = { fg = theme.colors.comment },
		UltestInfo = { fg = theme.colors.purple, style = theme.options.bold },

		-- Which-key
		WhichKey = { fg = theme.colors.purple, style = theme.options.bold },
		WhichKeyDesc = { fg = theme.colors.fg },
		WhichKeySeparator = { fg = theme.colors.green },
		WhichKeyFloat = { bg = theme.options.cursorline },
		WhichKeyGroup = { fg = theme.colors.blue, style = theme.options.italic },
	}
end

---Set the theme's options
---@return table
local function set_options()
	return {
		bold = theme.config.options.bold and "bold" or "NONE",
		italic = theme.config.options.italic and "italic" or "NONE",
		underline = theme.config.options.underline and "underline" or "NONE",
		undercurl = theme.config.options.undercurl and "undercurl" or "NONE",
		bold_italic = (bold ~= "NONE" and italic ~= "NONE") and "bold,italic" or "NONE",
		cursorline = (theme.config.options.cursorline or theme.config.options.highlight_cursorline)
				and theme.colors.cursorline
			or theme.colors.bg,
		transparency = (theme.config.options.transparency or theme.config.options.transparent) and "NONE"
			or theme.colors.bg,
	}
end

---Set the highlight groups to be loaded.
---This is based on the default groups (in this file) and the plugins
---@return table hlgroups
local function set_hlgroups()
	local hlgroups = default_hlgroups()
	local plugins = theme.config.plugins

	-- If a plugin has been enabled, then merge its hlgroups with the defaults
	for plugin in pairs(plugins) do
		if plugins[plugin] then
			hlgroups = vim.tbl_deep_extend("force", hlgroups, require("onedarkpro.plugins." .. plugin).get(theme))
		end
	end

	return hlgroups
end

---Setup the theme by setting the options and the highlight groups
---@param name string Optional: The name of the theme to load
---@return table theme
function M.setup_theme(name)
	theme.config = require("onedarkpro.config").config
	theme.colors = require("onedarkpro.colors").get_theme_colors(name)
	theme.options = set_options()
	theme.hlgroups = set_hlgroups()

	return theme
end

return M
