if exists('g:loaded_onedarkpro') | finish | endif

command! OnedarkproCache lua require("onedarkpro").cache()
command! OnedarkproClean lua require("onedarkpro").clean()
command! OnedarkproColors lua require("onedarkpro.utils.colorizer").show()
command! OnedarkproExportToAlacritty lua require("onedarkpro.utils.templates.alacritty").showInNewBuffer('Onedarkpro Alacritty cfg')
command! OnedarkproExportToKitty lua require("onedarkpro.utils.templates.kitty").showInNewBuffer('Onedarkpro Kitty cfg')
command! OnedarkproExportToWindowsTerminal lua require("onedarkpro.utils.templates.windowsterminal").showInNewBuffer('Onedarkpro Windows Terminal cfg')

let g:loaded_onedarkpro = 1
