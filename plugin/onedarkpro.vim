if exists('g:loaded_onedarkpro') | finish | endif

command! OnedarkproCache lua require("onedarkpro").cache()
command! OnedarkproClean lua require("onedarkpro").clean()
command! OnedarkproColors lua require("onedarkpro.utils.colorizer").show()
command! OnedarkproExportToWindowsTerminal lua require("onedarkpro.utils.templates.windowsterminal").showInNewBuffer('Onedarkpro Windows Terminal cfg')
command! OnedarkproExportToAlacritty lua require("onedarkpro.utils.templates.alacritty").showInNewBuffer('Onedarkpro Alacritty cfg')

let g:loaded_onedarkpro = 1
