" Only load the theme once
if exists('g:loaded_onedark') | finish | endif

command! -nargs=* -complete=customlist,v:lua.require'onedark'.load_complete OnedarkLoad lua require('onedark').load(<q-args>)

let g:loaded_onedark = 1