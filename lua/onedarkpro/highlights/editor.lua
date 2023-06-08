local M = {}

---Set the highlight groups for the editor
---@param theme table
---@return table
function M.groups(theme)
    local color = require("onedarkpro.helpers")
    local config = require("onedarkpro.config").config

    return {
        ColorColumn = { bg = theme.generated.color_column }, -- used for the columns set with 'colorcolumn'
        Conceal = { fg = theme.palette.fg }, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = { bg = theme.palette.purple, fg = theme.palette.bg }, -- character under the cursor
        -- lCursor      = {}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     = {bg = theme.palette.red}, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { bg = theme.palette.gray }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine = { bg = config.options.cursorline and theme.generated.cursorline or theme.palette.bg }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        CursorLineNr = {
            bg = config.options.cursorline and theme.generated.cursorline or theme.palette.bg,
            fg = theme.palette.purple,
        }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        CursorLineNrNC = { bg = theme.generated.color_column, fg = theme.palette.gray }, -- CursorLineNr for inactive windows
        CursorLineNrNCQuickFix = { bg = theme.palette.bg, fg = theme.palette.purple }, -- CursorLineNr for inactive quickfix windows
        Directory = { fg = theme.palette.blue }, -- directory names (and other special names in listings)
        DiffAdd = { bg = theme.generated.diff_add }, -- diff mode: Added line |diff.txt|
        DiffChange = { bg = "NONE" }, -- diff mode: Changed line |diff.txt|
        DiffDelete = { bg = theme.generated.diff_delete },
        DiffText = { bg = theme.generated.diff_text }, -- diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer = { fg = theme.palette.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        ErrorMsg = { fg = theme.palette.red }, -- error messages on the command line
        VertSplit = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.gray }, -- the column separating vertically split windows
        Folded = { bg = config.options.transparency and "NONE" or theme.generated.fold, fg = theme.palette.gray }, -- line used for closed folds
        FoldedNC = {
            bg = config.options.transparency and "NONE" or theme.generated.color_column,
            fg = theme.palette.gray,
        }, -- Folded for inactive windows
        FoldColumn = {
            bg = config.options.transparency and "NONE" or theme.palette.bg,
            fg = theme.generated.line_number,
        }, -- 'foldcolumn'
        SignColumn = { bg = config.options.transparency and "NONE" or theme.palette.bg }, -- column where |signs| are displayed
        SignColumnNC = {
            bg = config.options.transparency and "NONE" or theme.generated.color_column,
            fg = theme.palette.gray,
        }, -- SignColumn for inactive windows
        Substitute = { bg = theme.palette.yellow, fg = theme.palette.bg }, -- |:substitute| replacement text highlighting
        LineNr = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.generated.line_number }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrNC = {
            bg = config.options.transparency and "NONE" or theme.generated.color_column,
            fg = theme.generated.line_number,
        }, -- LineNr for inactive windows
        MatchParen = { fg = theme.palette.cyan }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg = { link = "Normal" }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea = { link = "ModeMsg" }, -- Area for messages and cmdline
        MsgSeparator = { link = "ModeMsg" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg = { fg = theme.palette.green }, -- |more-prompt|
        NonText = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.gray }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.fg }, -- normal text
        NormalNC = {
            bg = config.options.transparency and "NONE"
                or config.options.highlight_inactive_windows and theme.generated.color_column
                or theme.palette.bg,
            fg = theme.palette.fg,
        }, -- normal text in non-current windows
        NormalFloat = { bg = config.options.transparency and "NONE" or theme.generated.float_bg }, -- Normal text in floating windows.
        FloatBorder = {
            bg = config.options.transparency and "NONE" or theme.generated.float_bg,
            fg = theme.palette.gray,
        },
        Pmenu = { bg = theme.generated.float_bg }, -- Popup menu: normal item.
        PmenuSel = {
            bg = (
                theme.meta.light == false and color.lighten(theme.palette.bg, 3) or color.darken(theme.palette.bg, 8)
            ),
        }, -- Popup menu: selected item.
        PmenuSbar = {
            bg = (
                theme.meta.light == false and color.lighten(theme.palette.bg, 3) or color.darken(theme.palette.bg, 8)
            ),
        }, -- Popup menu: scrollbar.
        PmenuThumb = {
            bg = (
                theme.meta.light == false and color.lighten(theme.palette.bg, 5) or color.darken(theme.palette.bg, 12)
            ),
        }, -- Popup menu: Thumb of the scrollbar.
        Question = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.gray }, -- |hit-enter| prompt and yes/no questions
        QuickFixLine = { bg = config.options.cursorline and theme.generated.cursorline or theme.palette.bg }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        QuickFixLineNC = { bg = theme.palette.bg }, -- QuickFixLine, for inactive windows
        Search = { bg = theme.generated.selection, fg = theme.palette.yellow }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        -- SpecialKey   = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| SpellBad  Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.  SpellCap  Word that should start with a capital. |spell| Combined with the highlighting used otherwise.  SpellLocal  Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare    = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
        IncSearch = { bg = theme.generated.selection, fg = theme.palette.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        StatusLine = {
            bg = config.options.transparency and "NONE" or theme.palette.bg,
            fg = theme.palette.fg,
            bold = true,
        }, -- status line of current window
        StatusLineNC = {
            bg = config.options.transparency and "NONE"
                or config.options.highlight_inactive_windows and theme.generated.color_column
                or theme.palette.bg,
            fg = theme.palette.fg,
        }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine = { bg = config.options.transparency and "NONE" or theme.palette.bg }, -- tab pages line, not active tab page label
        TabLineFill = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.fg }, -- tab pages line, where there are no labels
        TabLineSel = { bg = theme.palette.purple, fg = theme.palette.bg }, -- tab pages line, active tab page label
        TermCursor = { bg = theme.palette.purple }, -- cursor in a focused terminal
        TermCursorNC = { bg = theme.palette.gray }, -- cursor in an unfocused terminal
        Title = { fg = theme.palette.green }, -- titles for output from ":set all", ":autocmd"
        Visual = { bg = theme.generated.selection }, -- Visual mode selection
        VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg = { fg = theme.palette.yellow }, -- warning messages
        WinBar = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.fg },
        WinBarNC = {
            bg = config.options.transparency and "NONE"
                or config.options.highlight_inactive_windows and theme.generated.color_column
                or theme.palette.bg,
            fg = theme.palette.fg,
        },
        WinSeparator = { bg = config.options.transparency and "NONE" or theme.palette.bg, fg = theme.palette.gray }, -- the column separating windows
        Whitespace = { fg = theme.palette.gray }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        WildMenu = { bg = theme.palette.blue, fg = theme.palette.black }, -- current match in 'wildmenu' completion

        -- Syntax groups

        -- Git
        diffFile = { fg = theme.generated.git_change },
        diffNewFile = { fg = theme.generated.git_change },
        diffLine = { fg = theme.palette.blue },

        -- Spelling
        SpellBad = { fg = theme.palette.red, sp = theme.palette.red, undercurl = true },
        SpellCap = { fg = theme.palette.red, sp = theme.palette.red, undercurl = true },
        SpellLocal = { fg = theme.palette.red, sp = theme.palette.red, undercurl = true },
        SpellRare = { fg = theme.palette.red, sp = theme.palette.red, undercurl = true },
    }
end

return M
