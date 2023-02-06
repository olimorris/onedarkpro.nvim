if exists('g:loaded_onedarkpro') | finish | endif

command! OnedarkproCache lua require("onedarkpro").cache()
command! OnedarkproClean lua require("onedarkpro").clean()
command! OnedarkproColors lua require("onedarkpro.utils.colorizer").show()
command! OnedarkproExportToAlacritty lua require("onedarkpro.extra.alacritty").show_in_buffer('Onedarkpro Alacritty cfg')
command! OnedarkproExportToKitty lua require("onedarkpro.extra.kitty").show_in_buffer('Onedarkpro Kitty cfg')
command! OnedarkproExportToWindowsTerminal lua require("onedarkpro.extra.windows_terminal").show_in_buffer('Onedarkpro Windows Terminal cfg')

let g:loaded_onedarkpro = 1
