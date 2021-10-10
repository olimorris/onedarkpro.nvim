" Only load the theme once
if exists('g:loaded_onedark') | finish | endif

command! -nargs=* OnedarkLoad lua require('onedark').load(<q-args>)

let g:loaded_onedark = 1