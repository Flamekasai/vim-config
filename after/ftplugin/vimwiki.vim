let b:undo_ftplugin = "setlocal spell< keymap= formatoptions< textwidth< colorcolumn<"
setlocal spell keymap=spanish-custom formatoptions-=o textwidth=72 colorcolumn=+1

nnoremap <buffer> <unique> <leader>z 1z=
let b:undo_ftplugin .= " | nunmap <buffer> <leader>z"
