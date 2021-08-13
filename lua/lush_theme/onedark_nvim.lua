local lush = require('lush')
local hsl = lush.hsl
----------------------------------COLOR PALETTE---------------------------------
local colors = {
  -- dark palette
  red = "#e06c75",
  green = "#98C379",
  yellow = "#ecbf6f",
  blue = "#61afef",
  purple = "#c678dd",
  cyan = "#56b6c2",
  white = "#abb2bf",
  black = "#1E1E1E",
  gray = "#4c4f55",
  search_yellow = "#e2be7d",
  comment_gray = "#7e848f",
  selection_gray = "#3e4452",
  indentline_gray = "#3a4049",
  colorcolumn_gray = "#232323",

  -- light palette
  red_light = "#e05661",
  green_light = "#1da912",
  yellow_light = "#eea825",
  blue_light = "#118dc3",
  purple_light = "#9a77cf",
  cyan_light = "#56B6C2",
  white_light = "#fafafa",
  black_light = "#6a6a6a",
  gray_light = "#bebebe",
  search_yellow_light = "#e2be7d",
  comment_gray_light = "#9a9a9a",
  selection_gray_light = "#bfceff",
  indentline_gray_light = "#d3d3d3",
  colorcolumn_gray_light = "#f2f2f2",
}
--------------------------------CUSTOM FUNCTIONS--------------------------------
-- allow users to overwrite specific colors
if vim.g.onedark_override ~= nil then
  local override = vim.g.onedark_override

  for k, v in pairs(override) do
    colors[k] = v
  end
end

-- options (dark mode by default)
local bg1 = colors.black
local fg1 = colors.white

local red = colors.red
local green = colors.green
local yellow = colors.yellow
local blue = colors.blue
local purple = colors.purple
local cyan = colors.cyan
local black = colors.black
local white = colors.white
local gray = colors.gray
local search_yellow = colors.search_yellow
local comment_gray = colors.comment_gray
local selection_gray = colors.selection_gray
local indentline_gray = colors.indentline_gray
local colorcolumn_gray = colors.colorcolumn_gray

-- -- handle light/dark contrast settings
local bg = vim.o.background
if bg == nil then
  bg = "dark"
  vim.o.background = bg
end

-- color options
if bg == 'light' then
  bg1 = colors.white_light
  fg1 = colors.black_light

  red = colors.red_light
  green = colors.green_light
  yellow = colors.yellow_light
  blue = colors.blue_light
  purple = colors.purple_light
  cyan = colors.cyan_light
  black = colors.black_light
  white = colors.white_light
  gray = colors.gray_light
  search_yellow = colors.search_yellow
  comment_gray = colors.comment_gray_light
  selection_gray = colors.selection_gray_light
  indentline_gray = colors.indentline_gray_light
  colorcolumn_gray = colors.colorcolumn_gray_light
end

-- Set the terminal colors
vim.g.terminal_color_0 = black
vim.g.terminal_color_1 = red
vim.g.terminal_color_2 = green
vim.g.terminal_color_3 = yellow
vim.g.terminal_color_4 = blue
vim.g.terminal_color_5 = purple
vim.g.terminal_color_6 = cyan
vim.g.terminal_color_7 = gray
vim.g.terminal_color_8 = comment_gray
vim.g.terminal_color_9 = red
vim.g.terminal_color_10 = green
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_12 = blue
vim.g.terminal_color_13 = purple
vim.g.terminal_color_14 = cyan
vim.g.terminal_color_15 = white
vim.g.terminal_color_background = bg1
vim.g.terminal_color_foreground = fg1

local styles = {
  bold = "bold",
  italic = "italic",
  underline = "underline",
  bold_italic = "bold italic",
  bold_underline = "bold underline",
  italic_underline = "italic underline"
}

-- theme settings
local bold_strings = styles.bold
local italic_strings = styles.italic
local underline_strings = styles.underline
local bold_italic_strings = styles.bold_italic
local bold_underline_strings = styles.bold_underline
local italic_underline_strings = styles.italic_underline

if vim.g.onedark_settings ~= nil then
  if vim.g.onedark_settings.bold == false then
    bold_strings = "NONE"
  end
  if not vim.g.onedark_settings.italic == false then
    italic_strings = "NONE"
  end
  if not vim.g.onedark_settings.underline == false then
    underline_strings = "NONE"
  end
  if bold_strings == "NONE" or italic_strings == "NONE" then
    bold_italic_strings = "NONE"
  end
  if bold_strings == "NONE" or underline_strings == "NONE" then
    bold_underline_strings = "NONE"
  end
  if italic_strings == "NONE" or underline_strings == "NONE" then
    italic_underline_strings = "NONE"
  end
end

------------------------------------THE THEME-----------------------------------
local theme = lush(function()
  return {
    ColorColumn {bg = colorcolumn_gray}, -- used for the columns set with 'colorcolumn'
    Comment {fg = comment_gray, gui = italic_strings}, -- Comments
    -- Conceal      {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor {bg = blue, fg = bg1}, -- character under the cursor
    -- lCursor      {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     {bg = red}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn {bg = gray}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   {bg = selection_gray}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory {fg = blue}, -- directory names (and other special names in listings)
    DiffAdd {bg = green, fg = black}, -- diff mode: Added line |diff.txt|
    DiffChange {fg = yellow, gui = "underline"}, -- diff mode: Changed line |diff.txt|
    DiffDelete {bg = red, fg = bg1},
    DiffText {bg = yellow, fg = bg1}, -- diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  {}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   {}, -- cursor in a focused terminal
    -- TermCursorNC {}, -- cursor in an unfocused terminal
    ErrorMsg {fg = red}, -- error messages on the command line
    VertSplit {fg = gray}, -- the column separating vertically split windows
    Folded {fg = gray}, -- line used for closed folds
    FoldColumn {}, -- 'foldcolumn'
    SignColumn {}, -- column where |signs| are displayed
    IncSearch {bg = selection_gray, fg = yellow}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute {bg = yellow, fg = bg1}, -- |:substitute| replacement text highlighting
    LineNr {fg = gray}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr {fg = purple, gui = bold_strings}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen {fg = cyan, gui = "underline"}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg {fg = gray}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea {ModeMsg}, -- Area for messages and cmdline
    MsgSeparator {ModeMsg}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      {fg = green}, -- |more-prompt|
    NonText {fg = gray}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal {bg = bg1, fg = fg1}, -- normal text
    NormalFloat {Normal}, -- Normal text in floating windows.
    NormalNC {Normal}, -- normal text in non-current windows
    Pmenu {bg = gray}, -- Popup menu: normal item.
    PmenuSel {bg = green, fg = bg1}, -- Popup menu: selected item.
    PmenuSbar {bg = gray}, -- Popup menu: scrollbar.
    PmenuThumb   {bg = gray}, -- Popup menu: Thumb of the scrollbar.
    Question     {fg = gray}, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       {bg = gray}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    -- SpecialKey   {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine {bg = bg1, fg = fg1}, -- status line of current window
    StatusLineNC {bg = bg1, fg = fg1}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine {bg = comment_gray}, -- tab pages line, not active tab page label
    TabLineFill  {bg = comment_gray, fg = fg1}, -- tab pages line, where there are no labels
    TabLineSel {bg = comment_gray}, -- tab pages line, active tab page label
    Title {fg = green}, -- titles for output from ":set all", ":autocmd" etc.
    Visual {bg = selection_gray}, -- Visual mode selection
    VisualNOS {Visual}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg {fg = yellow}, -- warning messages
    Whitespace   {fg = comment_gray}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu {bg = blue, fg = black}, -- current match in 'wildmenu' completion

    -- Syntax groups
    Constant       {fg = cyan}, -- (preferred) any constant
    String         {fg = green}, --   a string constant: "this is a string"
    Character      {fg = green}, --  a character constant: 'c', '\n'
    Number         {fg = yellow}, --   a number constant: 234, 0xff
    Boolean        {fg = yellow}, --  a boolean constant: TRUE, false
    Float          {fg = yellow}, --    a floating point constant: 2.3e10

    Identifier     {fg = purple}, -- (preferred) any variable name
    Function       {fg = yellow}, -- function name (also: methods for classes)

    Statement      {fg = purple}, -- (preferred) any statement
    Conditional    {fg = purple}, --  if, then, else, endif, switch, etc.
    Repeat         {fg = purple}, --   for, do, while, etc.
    Label          {fg = red}, --    case, default, etc.
    Operator       {fg = cyan}, -- "sizeof", "+", "*", etc.
    Keyword        {fg = red}, --  any other keyword
    Exception      {fg = purple}, --  try, catch, throw

    PreProc        {fg = yellow}, -- (preferred) generic Preprocessor
    Include        {fg = purple}, --  preprocessor #include
    Define         {fg = purple}, --   preprocessor #define
    Macro          {fg = purple}, --    same as Define
    PreCondit      {fg = yellow}, --  preprocessor #if, #else, #endif, etc.

    Type           {fg = yellow}, -- (preferred) int, long, char, etc.
    StorageClass   {fg = yellow}, -- static, register, volatile, etc.
    Structure      {fg = yellow}, --  struct, union, enum, etc.
    Typedef        {fg = yellow}, --  A typedef

    Special        {fg = blue}, -- (preferred) any special symbol
    SpecialChar    {fg = yellow}, --  special character in a constant
--     Tag            {}, --    you can use CTRL-] on this
    Delimiter      {fg = fg1}, --  character that needs attention
    SpecialComment {fg = comment_gray}, -- special things inside a comment
--     Debug          {}, --    debugging statements

    Underlined {gui = underline_strings}, -- (preferred) text that stands out, HTML links
    Bold {gui = bold_strings},
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|
    Italic {gui = italic_strings},
    Error {fg = red}, -- (preferred) any erroneous construct
    Todo {fg = purple, gui = bold_italic_strings}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- LSP
    LspDiagnosticsDefaultError {fg = red},
    LspDiagnosticsSignError {fg = red},
    LspDiagnosticsUnderlineError {fg = red, gui = underline_strings},
    LspDiagnosticsDefaultWarning {fg = yellow},
    LspDiagnosticsSignWarning {fg = yellow},
    LspDiagnosticsUnderlineWarning {fg = yellow, gui = underline_strings},
    LspDiagnosticsDefaultInformation {fg = blue},
    LspDiagnosticsSignInformation {fg = blue},
    LspDiagnosticsUnderlineInformation {fg = blue, gui = underline_strings},
    LspDiagnosticsDefaultHint {fg = cyan},
    LspDiagnosticsSignHint {fg = cyan},
    LspDiagnosticsUnderlineHint {gui = underline_strings},
    LspReferenceText {bg = selection_gray}, -- used for highlighting "text" references
    LspReferenceRead {LspReferenceText}, -- used for highlighting "read" references
    LspReferenceWrite {LspReferenceText}, -- used for highlighting "write" references

    -- Tree Sitter
    TSError {fg = red}, -- For syntax/parser errors.

    TSPunctDelimiter {fg = fg1}, -- For delimiters ie: `.`
    TSPunctBracket {fg = red}, -- For brackets and parens.
    TSPunctSpecial {fg = fg1}, -- For special punctutation that does not fall in the catagories before.

    TSConstant {fg = yellow}, -- For constants
    TSConstBuiltin {fg = yellow}, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro {fg = yellow}, -- For constants that are defined by macros: `NULL` in C.
    TSString {fg = green}, -- For strings.
    TSStringRegex {fg = green}, -- For regexes.
    TSStringEscape {fg = cyan}, -- For escape characters within a string.
    TSStringSpecial {Special},
    TSCharacter {fg = green}, -- For characters.
    TSNumber {fg = yellow}, -- For integers.
    TSBoolean {fg = yellow}, -- For booleans.
    TSFloat {fg = yellow}, -- For floats.

    TSFunction {fg = blue}, -- For function (calls and definitions).
    TSFuncBuiltin {fg = blue}, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro {fg = cyan}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSParameter {fg = yellow, gui = italic_strings}, -- For parameters of a function.
    TSParameterReference {fg = yellow}, -- For references to parameters of a function.
    TSMethod {fg = blue}, -- For method calls and definitions.
    TSField {fg = red}, -- For fields.
    TSProperty {fg = red}, -- Same as `TSField`.
    TSConstructor {fg = cyan}, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
    TSAnnotation {fg = red}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute {fg = purple},
    TSNamespace {fg = purple}, -- For identifiers referring to modules and namespaces.
    TSSymbol {fg = red},    -- For identifiers referring to symbols or atoms.

    TSConditional {fg = purple, gui = italic_strings}, -- For keywords related to conditionnals.
    TSRepeat {fg = purple, gui = italic_strings}, -- For keywords related to loops.
    TSLabel {fg = purple, gui = italic_strings}, -- For labels: `label:` in C and `:label:` in Lua.
    TSOperator {fg = cyan}, -- For any operator: `+`, but also `->` and `*` in C.
    TSKeyword {fg = purple, gui = bold_italic_strings}, -- For keywords that don't fall in previous categories.
    TSKeywordFunction {TSKeyword}, -- For keywords used to define a fuction.
    TSKeywordOperator {fg = red},
    TSKeywordReturn {TSKeyword}, -- The return...obviously
    TSException {fg = green}, -- For exception related keywords.

    TSType {fg = yellow}, -- For types.
    TSTypeBuiltin {fg = red}, -- For builtin types (you guessed it, right ?).
    TSInclude {fg = purple, gui = italic_strings}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.

    TSVariable {fg = fg1}, -- Any variable name that does not have another highlight.
    TSVariableBuiltin    {fg = yellow, gui = italic_strings}, -- Variable names that are defined by the languages, like `this` or `self`.

    TSText {fg = fg1}, -- For strings considered text in a markup language.
    TSStrong {fg = yellow, gui = bold_strings}, -- For text to be represented with strong.
    TSEmphasis {fg = yellow, gui = italic_strings}, -- For text to be represented with emphasis.
    TSUnderline {fg = yellow, gui = underline_strings}, -- For text to be represented with an underline.
    TSStrike {fg = fg1},    -- For strikethrough text.
    TSMath {fg = fg1},
    TSTextReference {TSText},
    TSEnvironment {Macro},
    TSEnvironmentName {Type},
    TSTitle {fg = yellow}, -- Text that is part of a title.
    TSLiteral {fg = yellow}, -- Literal text.
    TSURI {fg = blue}, -- Any URI like a link or email.

    TSComment {fg = comment_gray},    -- For comment blocks.
    TSNote {fg = yellow},    -- TODO: docs
    TSWarning {Todo},
    TSDanger {WarningMsg},

    TSTag {fg = red, gui = "NONE"},    -- Tags like html tag names.
    TSTagDelimiter {Delimiter},    -- Tag delimiter like `<` `>` `/`
    TSTagAttribute {TSProperty},

    -- CSS
    cssAttrComma {fg = purple},
    cssAttributeSelector {fg = green},
    cssBraces {fg = red},
    cssClassName {fg = yellow},
    cssClassNameDot {fg = yellow},
    cssDefinition {fg = purple, gui = bold_italic_strings},
    cssFontAttr {fg = yellow},
    cssFontDescriptor {cssDefinition},
    cssFunctionName {fg = blue},
    cssIdentifier {fg = blue},
    cssImportant {cssDefinition},
    cssInclude {fg = fg1},
    cssIncludeKeyword {cssDefinition},
    cssMediaType {fg = yellow},
    cssProp {fg = fg1},
    cssPseudoClassId {fg = yellow},
    cssSelectorOp {cssDefinition},
    cssSelectorOp2 {cssDefinition},
    cssTagName {fg = red},

    -- Git
    diffAdded {fg = green},
    diffRemoved {fg = red},
    diffChanged {fg = yellow},
    diffFile {fg = yellow},
    diffNewFile {fg = yellow},
    diffLine {fg = blue},
    GitGutterAdd {diffAdded},
    GitGutterChange {diffChanged},
    GitGutterDelete {diffRemoved},
    GitGutterChangeDelete {diffRemoved},

    -- HTML
    htmlArg {fg = purple, gui = bold_italic_strings},
    htmlBold {fg = yellow, gui = bold_strings},
    htmlItalic {fg = purple, gui = italic_strings},
    htmlLink {fg = cyan, gui = underline_strings},
    htmlH1 {fg = red},
    htmlH2 {htmlH1},
    htmlH3 {htmlH1},
    htmlH4 {htmlH1},
    htmlH5 {htmlH1},
    htmlH6 {htmlH1},
    htmlSpecialChar {fg = yellow},
    htmlSpecialTagName {fg = red},
    htmlTag {TSTag},
    htmlEndTag {htmlTag},
    htmlTagN {fg = red},
    htmlTagName {fg = red},
    htmlTitle {fg = fg1},

    -- Javascript
    javascriptBraces {fg = red},
    javaScriptFunction {fg = purple},
    javaScriptIdentifier {fg = purple},
    javaScriptNull {fg = yellow},
    javaScriptNumber {fg = yellow},
    javaScriptRequire {fg = cyan},
    javaScriptReserved {fg = purple},
    ---- https://github.com/pangloss/vim-javascript included in Vim-Polygot
    jsArrowFunction {fg = purple, gui = bold_italic_strings},
    jsClassKeyword {jsArrowFunction},
    jsClassMethodType {jsArrowFunction},
    jsDocParam {fg = blue},
    jsDocTags {fg = purple},
    jsExport {jsArrowFunction},
    jsExportDefault {jsExport},
    jsExtendsKeyword {jsClassKeyword},
    jsFrom {jsExport},
    jsFuncCall {fg = blue},
    jsFunction {jsArrowFunction},
    jsGenerator {fg = yellow},
    jsGlobalObjects {jsGenerator},
    jsImport {jsExport},
    jsModuleAs {jsExport},
    jsModuleWords {jsExport},
    jsModules {jsExport},
    jsNull {fg = yellow},
    jsOperator {fg = purple},
    jsStorageClass {jsClassKeyword},
    jsSuper {fg = red},
    jsTemplateBraces {fg = red},
    jsTemplateVar {fg = green},
    jsThis {fg = red},
    jsUndefined {fg = yellow},

    -- JSON
    jsonCommentError {fg = fg1},
    jsonKeyword {fg = red},
    jsonBoolean {fg = yellow},
    jsonNumber {fg = yellow},
    jsonQuote {fg = fg1},
    jsonMissingCommaError {fg = red, gui = "reverse"},
    jsonNoQuotesError {jsonMissingCommaError},
    jsonNumError {jsonMissingCommaError},
    jsonString {fg = green},
    jsonStringSQError {jsonMissingCommaError},
    jsonSemicolonError {jsonMissingCommaError},

    -- Markdown
    markdownBlockquote {fg = comment_gray},
    markdownBold {fg = yellow, gui = bold_strings},
    markdownCode {fg = green},
    markdownCodeBlock {markdownCode},
    markdownCodeDelimiter {markdownCode},
    markdownH1 {fg = red},
    markdownH2 {markdownH1},
    markdownH3 {markdownH1},
    markdownH4 {markdownH1},
    markdownH5 {markdownH1},
    markdownH6 {markdownH1},
    markdownHeadingDelimiter {fg = red},
    markdownHeadingRule {markdownBlockquote},
    markdownId {fg = purple, gui = bold_italic_strings},
    markdownIdDeclaration {fg = blue},
    markdownIdDelimiter {markdownId},
    markdownItalic {fg = purple, gui = italic_strings},
    markdownLinkDelimiter {fg = purple},
    markdownLinkText {fg = blue},
    markdownListMarker {fg = red},
    markdownOrderedListMarker {markdownListMarker},
    markdownRule { markdownBlockquote},
    markdownUrl {fg = cyan, gui = underline_strings},

    -- Python
    pythonNone {fg = yellow},
    pythonBoolean {pythonNone},
    pythonClass {fg = yellow},
    pythonParens {fg = red},
    pythonBuiltinObj {fg = cyan, gui = bold_strings},
    pythonSpaceError {bg = red, fg = fg1},
    pythonString {fg = green},
    pythonDot {fg = fg1},
    pythonImport {fg = purple, gui = bold_italic_strings},
    pythonRepeat {pythonImport},
    pythonStatement {pythonImport},
    pythonOperator {pythonImport},

    -- Ruby
    rubyBlockParameter {fg = red},
    rubyBlockParameterList {rubyBlockParameter},
    rubyClass {fg = purple, gui = bold_italic_strings},
    rubyConstant {fg = yellow},
    rubyControl {rubyClass},
    rubyEscape {fg = red},
    rubyFunction {fg = blue},
    rubyGlobalVariable {fg = red},
    rubyInclude {fg = blue},
    rubyIncluderubyGlobalVariable {rubyGlobalVariable},
    rubyInstanceVariable {rubyGlobalVariable},
    rubyInterpolation {fg = cyan},
    rubyInterpolationDelimiter {fg = red},
    rubyRegexp {fg = cyan},
    rubyRegexpDelimiter {rubyRegexp},
    rubyStringDelimiter {fg = green},
    rubySymbol {fg = cyan},

    -- SASS
    sassidChar {fg = red},
    sassClassChar {fg = yellow},
    sassInclude {fg = purple, gui = bold_italic_strings},
    sassMixing {sassInclude},
    sassMixinName {fg = blue},
    scssExtend {sassInclude},
    scssImport {sassInclude},
    scssMixin {sassMixing},
    scssSelectorName {fg = yellow},
    scssVariable {sassMixing},
-------------------------------------PLUGINS------------------------------------
    -- Barbar.nvim
    BufferCurrent {fg = purple, bg = bg1},
    -- BufferCurrentIndex {},
    BufferCurrentMod {fg = purple},
    BufferCurrentSign {BufferCurrentMod},
    BufferCurrentIcon {BufferCurrentMod},
    -- BufferCurrentTarget {},
    BufferVisible {fg = gray},
    -- BufferVisibleIndex {},
    BufferVisibleMod {fg = gray},
    BufferVisibleSign {BufferVisibleMod},
    BufferVisibleIcon {BufferVisibleMod},
    -- BufferVisibleTarget {},
    BufferInactive {fg = gray, bg = bg1}, -- Buffer which is not active
    -- BufferInactiveIndex {},
    BufferInactiveMod {fg = gray},
    BufferInactiveSign {fg = bg1}, -- The inactive sign of a buffer
    -- BufferInactiveTarget {},
    BufferTabpages {fg = purple}, -- The tab page indicator on the right
    BufferTabpageFill {fg = bg1}, -- The sign which marks the end of the bufferline

    -- Bufferline
    BufferlineFill {bg = bg1},
    BufferlineBg {BufferlineFill},
    BufferLineIndicatorSelected {fg = purple},
    BufferlineBufferSelected {fg = purple},
    BufferlineBufferVisible {BufferlineBufferSelected},
    BufferlinePickSelected {fg = yellow},
    BufferlinePickVisible {BufferlinePickSelected},
    BufferlineModifiedSelected { fg = red},
    BufferlineModifiedVisible {BufferlineModifiedSelected},

    -- Dashboard
    -- dashboardHeader {},
    dashboardCenter {fg = purple, gui = bold_strings},
    dashboardFooter {fg = blue},
    --dashboardShortCut {},

    -- hlslens
    HlSearchNear {bg = search_yellow, fg = bg1},
    HlSearchLens {bg = gray},
    HlSearchLensNear {HlSearchNear},
    HlSearchFloat {HlSearchNear},

    -- Indent line
    IndentLine {fg = indentline_gray},
    IndentBlanklineChar {IndentLine},
    IndentBlanklineSpaceChar {IndentLine},
    IndentBlanklineSpaceCharBlankline {IndentLine},
    IndentBlanklineContextChar {IndentLine},

    -- LSP Saga
    LspSagaDiagnosticBorder {NormalNC},
    LspSagaDiagnosticHeader {fg = purple},
    LspSagaDiagnosticTruncateLine {NormalNC},
    LspFloatWinBorder {NormalNC},
    LspSagaBorderTitle {Title},
    TargetWord {Error},
    ReferencesCount {Title},
    ReferencesIcon {Special},
    DefinitionCount {Title},
    TargetFileName {fg = comment_gray},
    DefinitionIcon {Special},
    ProviderTruncateLine {NormalNC},
    SagaShadow {},
    LspSagaFinderSelection {Search},
    DiagnosticTruncateLine {NormalNC},
    DiagnosticError {LspDiagnosticsDefaultError},
    DiagnosticWarning {LspDiagnosticsDefaultWarning},
    DiagnosticInformation {LspDiagnosticsDefaultInformation},
    DiagnosticHint {LspDiagnosticsDefaultHint},
    DefinitionPreviewTitle {Title},
    LspSagaShTruncateLine {NormalNC},
    LspSagaDocTruncateLine {NormalNC},
    LineDiagTuncateLine {NormalNC},
    LspSagaCodeActionTitle {Title},
    LspSagaCodeActionTruncateLine {NormalNC},
    LspSagaCodeActionContent {Normal},
    LspSagaRenamePromptPrefix {fg = purple},
    LspSagaRenameBorder {gui = bold_strings},
    LspSagaHoverBorder {gui = bold_strings},
    LspSagaSignatureHelpBorder {gui = bold_strings},
    LspSagaCodeActionBorder {gui = bold_strings},
    LspSagaAutoPreview {},
    LspSagaDefPreviewBorder {gui = bold_strings},
    LspLinesDiagBorder {gui = bold_strings},

    --nvim-compe
    CompeDocumentation {fg = fg1, bg = colorcolumn_gray},

    --nvim-dap
    DebugBreakpoint {fg = red},
    DebugBreakpointLine {fg = red, gui = underline_strings},
    DebugHighlight {fg = blue},
    DebugHighlightLine {fg = purple, gui = italic_strings},
    NvimDapVirtualText {fg = cyan, gui = italic_underline_strings},

    --nvim-tree
    NvimTreeRootFolder {fg = purple, gui = bold_strings},
    NvimTreeFolderName {fg = blue},
    NvimTreeIndentMarker {fg = gray},
    NvimTreeSymlink {fg = cyan, gui = underline_strings},
    NvimTreeFolderIcon {fg = purple},
    NvimTreeEmptyFolderName {fg = comment_gray},
    NvimTreeExecFile {fg = green, gui = bold_underline_strings},
    NvimTreeSpecialFile {Special},
    NvimTreeImageFile {},
    NvimTreeMarkdownFile {fg = red},

    NvimTreeLicenseIcon {fg = yellow},
    NvimTreeYamlIcon {fg = yellow},
    NvimTreeTomlIcon {fg = yellow},
    NvimTreeGitignoreIcon {fg = red},
    NvimTreeJsonIcon {fg = green},
    
    NvimTreeLuaIcon {fg = blue},
    NvimTreePythonIcon {fg = yellow},
    NvimTreeShellIcon {fg = fg1},
    NvimTreeCIcon {fg = blue},
    NvimTreeReactIcon {fg = blue},
    NvimTreeHtmlIcon {fg = red},
    NvimTreeRustIcon {fg = fg1},
    NvimTreeTypescriptIcon {fg = blue},
    NvimTreeVimIcon {fg = green},
    NvimTreeJavascriptIcon {fg = yellow},

    NvimTreeGitDirty {fg = red},
    NvimTreeGitStaged {fg = yellow},
    NvimTreeGitMerge {fg = cyan},
    NvimTreeGitRenamed {fg = yellow},
    NvimTreeGitNew {fg = purple},
    
    -- Startify
    StartifyBracket {fg = fg1},
    StartifyFile {fg = purple, gui = bold_strings},
    StartifyFooter {fg = fg1},
    StartifyHeader {fg = green},
    StartifyNumber {fg = yellow},
    StartifyPath {fg = gray},
    StartifySection {fg = blue, gui = bold_italic_strings},
    StartifySelect {fg = cyan},
    StartifySlash {fg = gray},
    StartifySpecial {fg = red},

    -- Telescope
    TelescopeSelection {fg = purple},
    TelescopeSelectionCaret {fg = purple},
    TelescopeMultiSelection {fg = comment_gray},
    TelescopeNormal {fg = fg1},
    TelescopeBorder {fg = comment_gray},
    TelescopePromptBorder {TelescopeBorder},
    TelescopePreviewBorder {TelescopeBorder},
    TelescopeMatching {fg = green, gui = underline_strings},
    TelescopePromptPrefix {fg = purple},
    TelescopePrompt {TelescopeNormal},

    -- Ultest
    UltestPass {fg = green},
    UltestFail {fg = red},
    UltestRunning {fg = yellow},
    UltestBorder {fg = comment_gray},
    UltestInfo {fg = purple, gui = bold_strings},
   }
end)

-- Set highlight groups
vim.cmd("autocmd ColorScheme * highlight NormalFloat guibg=" .. bg1)
vim.cmd("autocmd ColorScheme * highlight FloatBorder guifg=" .. comment_gray)

return theme

-- vi:nowrap
--
