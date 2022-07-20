local M = {}
local theme = {}
local utils = require("onedarkpro.utils")

---Apply the colors and the config file to the theme's highlight groups
---@return table theme
local function default_hlgroups()
    return {
        ColorColumn = { bg = theme.colors.color_column }, -- used for the columns set with 'colorcolumn'
        Comment = {
            fg = theme.colors.gray,
            style = theme.config.styles.comments,
        }, -- Comments
        -- Conceal      = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = { bg = theme.colors.purple, fg = theme.colors.bg }, -- character under the cursor
        -- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     = {bg = theme.colors.red}, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { bg = theme.colors.gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine = { bg = theme.options.cursorline }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorLineNr = {
            bg = theme.options.cursorline,
            fg = theme.colors.purple,
            style = theme.options.bold,
        }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        Directory = { fg = theme.colors.blue }, -- directory names (and other special names in listings)
        DiffAdd = { bg = theme.colors.diff_add }, -- diff mode: Added line |diff.txt|
        DiffChange = { style = theme.options.underline }, -- diff mode: Changed line |diff.txt|
        DiffDelete = { bg = theme.colors.diff_delete },
        DiffText = { bg = theme.colors.diff_text }, -- diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer = { fg = theme.colors.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        TermCursor = { bg = theme.colors.purple }, -- cursor in a focused terminal
        TermCursorNC = { bg = theme.colors.gray }, -- cursor in an unfocused terminal
        ErrorMsg = { fg = theme.colors.red }, -- error messages on the command line
        Folded = { bg = theme.options.transparency, fg = theme.colors.gray }, -- line used for closed folds
        FoldColumn = { bg = theme.options.transparency, fg = theme.colors.gray }, -- 'foldcolumn'
        SignColumn = { bg = theme.options.transparency }, -- column where |signs| are displayed
        IncSearch = { bg = theme.colors.selection, fg = theme.colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute = { bg = theme.colors.yellow, fg = theme.colors.bg }, -- |:substitute| replacement text highlighting
        LineNr = { bg = theme.options.transparency, fg = theme.colors.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        MatchParen = { fg = theme.colors.cyan, style = theme.options.underline }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea = { link = "ModeMsg" }, -- Area for messages and cmdline
        MsgSeparator = { link = "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg = { fg = theme.colors.green }, -- |more-prompt|
        NonText = { bg = theme.options.transparency, fg = theme.colors.gray }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal = { bg = theme.options.transparency, fg = theme.colors.fg }, -- normal text
        NormalFloat = {
            bg = (
                theme.config.options.transparency and theme.colors.none
                or theme.colors.style == "dark" and utils.darken(theme.colors.bg, 0.85)
                or utils.darken(theme.colors.bg, 0.95)
            ),
        }, -- Normal text in floating windows.
        FloatBorder = { bg = theme.options.transparency, fg = theme.colors.gray },
        NormalNC = {
            bg = theme.config.options.transparency and theme.colors.none
                or theme.config.options.window_unfocussed_color and theme.colors.color_column
                or theme.colors.bg,
            fg = theme.colors.fg,
        }, -- normal text in non-current windows
        Pmenu = {
            bg = (theme.colors.style == "dark" and utils.darken(theme.colors.bg, 0.85) or utils.darken(
                theme.colors.bg,
                0.95
            )),
        }, -- Popup menu: normal item.
        PmenuSel = {
            bg = (theme.colors.style == "dark" and utils.lighten(theme.colors.bg, 0.97) or utils.darken(
                theme.colors.bg,
                0.98
            )),
        }, -- Popup menu: selected item.
        PmenuSbar = {
            bg = (theme.colors.style == "dark" and utils.lighten(theme.colors.bg, 0.97) or utils.darken(
                theme.colors.bg,
                0.98
            )),
        }, -- Popup menu: scrollbar.
        PmenuThumb = {
            bg = (theme.colors.style == "dark" and utils.lighten(theme.colors.bg, 0.5) or utils.darken(
                theme.colors.bg,
                0.5
            )),
        }, -- Popup menu: Thumb of the scrollbar.
        Question = { bg = theme.options.transparency, fg = theme.colors.gray }, -- |hit-enter| prompt and yes/no questions
        QuickFixLine = { bg = theme.options.cursorline }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search = { bg = theme.colors.selection, fg = theme.colors.yellow, style = theme.options.underline }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
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
        VertSplit = { bg = theme.options.transparency, fg = theme.colors.gray }, -- the column separating vertically split windows
        Visual = { bg = theme.colors.selection }, -- Visual mode selection
        VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg = { fg = theme.colors.yellow }, -- warning messages
        WinSeparator = { bg = theme.options.transparency, fg = theme.colors.gray }, -- the column separating windows
        Whitespace = { fg = theme.colors.comment }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        WildMenu = { bg = theme.colors.blue, fg = theme.colors.black }, -- current match in 'wildmenu' completion

        -- Syntax groups
        Constant = { fg = theme.colors.orange }, -- (preferred) any constant
        String = { fg = theme.colors.green, style = theme.config.styles.strings }, --   a string constant: "this is a string"
        Character = { fg = theme.colors.green }, -- a character constant: 'c', '\n'
        Number = { fg = theme.colors.orange }, -- a number constant: 234, 0xff
        Boolean = { fg = theme.colors.orange }, -- a boolean constant: TRUE, false
        Float = { fg = theme.colors.orange }, -- a floating point constant: 2.3e10

        Identifier = {
            fg = theme.colors.red,
            style = theme.config.styles.variables,
        }, -- (preferred) any variable name
        Function = {
            fg = theme.colors.blue,
            style = theme.config.styles.functions,
        }, -- function name (also: methods for classes)

        Statement = { fg = theme.colors.purple }, -- (preferred) any statement
        Conditional = { fg = theme.colors.purple, style = theme.options.italic }, --  if, then, else, endif, switch, ettheme.colors.
        Repeat = { fg = theme.colors.purple }, -- for, do, while, ettheme.colors.
        Label = { fg = theme.colors.red }, -- case, default, ettheme.colors.
        Operator = { fg = theme.colors.cyan, style = theme.options.italic }, -- "sizeof", "+", "*", ettheme.colors.
        Keyword = {
            fg = theme.colors.purple,
            style = theme.config.styles.keywords,
        }, -- any other keyword
        Exception = { fg = theme.colors.purple }, -- try, catch, throw

        PreProc = { fg = theme.colors.yellow }, -- (preferred) generic Preprocessor
        Include = { fg = theme.colors.purple }, -- preprocessor #include
        Define = { fg = theme.colors.purple }, -- preprocessor #define
        Macro = { fg = theme.colors.blue }, -- same as Define
        PreCondit = { fg = theme.colors.yellow }, -- preprocessor #if, #else, #endif, ettheme.colors.

        Type = { fg = theme.colors.yellow }, -- (preferred) int, long, char, ettheme.colors.
        StorageClass = { fg = theme.colors.yellow }, -- static, register, volatile, ettheme.colors.
        Structure = { fg = theme.colors.purple }, -- struct, union, enum, ettheme.colors.
        Typedef = { fg = theme.colors.purple }, -- A typedef

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

        -- Spelling
        SpellBad = { sp = theme.colors.red, style = theme.options.undercurl_underline },
        SpellCap = { sp = theme.colors.red, style = theme.options.undercurl_underline },
        SpellLocal = { sp = theme.colors.red, style = theme.options.undercurl_underline },
        SpellRare = { sp = theme.colors.red, style = theme.options.undercurl_underline },
    }
end

---Set the theme's options
---@return table
local function set_options()
    return {
        bold = theme.config.options.bold and "bold" or "NONE",
        italic = theme.config.options.italic and "italic" or "NONE",
        undercurl = theme.config.options.undercurl and "undercurl" or "NONE",
        underline = theme.config.options.underline and "underline" or "NONE",
        undercurl_underline = (
            theme.config.options.undercurl and "undercurl" or (theme.config.options.underline and "underline" or "NONE")
        ),
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

    local function load_plugin(plugin)
        if plugin == "all" then
            return
        end
        hlgroups = vim.tbl_deep_extend("force", hlgroups, require("onedarkpro.plugins." .. plugin).get(theme))
    end

    -- If a plugin has been enabled then we load it
    for plugin, load in pairs(plugins) do
        if load then
            load_plugin(plugin)
        end
    end

    return hlgroups
end

---Setup the theme by setting the options and the highlight groups
---@param name string Optional: The name of the theme to load
---@return table theme
function M.setup_theme()
    theme.config = require("onedarkpro.config").config
    theme.colors = require("onedarkpro.colors").get_theme_colors()
    theme.options = set_options()
    theme.hlgroups = set_hlgroups()

    return theme
end

return M
