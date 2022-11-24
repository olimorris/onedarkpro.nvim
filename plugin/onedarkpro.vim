if exists('g:loaded_onedarkpro') | finish | endif

command! OnedarkproCache lua require('onedarkpro').cache()
command! OnedarkproColors lua require('onedarkpro.utils.colorizer').show()

let g:loaded_onedarkpro = 1
