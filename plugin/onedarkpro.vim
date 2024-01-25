if exists('g:loaded_onedarkpro') | finish | endif

command! OnedarkproCache lua require("onedarkpro").cache()
command! OnedarkproClean lua require("onedarkpro").clean()
command! OnedarkproColors lua require("onedarkpro.utils.colorizer").show()
command! OnedarkproExportToAlacritty lua require("onedarkpro.extra.alacritty").show_in_buffer('OneDarkPro Alacritty')
command! OnedarkproExportToKitty lua require("onedarkpro.extra.kitty").show_in_buffer('OneDarkPro Kitty')
command! OnedarkproExportToWezterm lua require("onedarkpro.extra.wezterm").show_in_buffer('OneDarkPro Wezterm')
command! OnedarkproExportToWindowsTerminal lua require("onedarkpro.extra.windows_terminal").show_in_buffer('OneDarkPro Windows Terminal')
command! OnedarkproExportToFoot lua require("onedarkpro.extra.foot").show_in_buffer('OneDarkPro Foot')
command! OnedarkproExportToRio lua require("onedarkpro.extra.rio").show_in_buffer('OneDarkPro Rio')
command! OnedarkproExportToZellij lua require("onedarkpro.extra.zellij").show_in_buffer('OneDarkPro Zellij')

let g:loaded_onedarkpro = 1
