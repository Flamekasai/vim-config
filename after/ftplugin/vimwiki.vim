let b:undo_ftplugin = "setlocal spell< keymap= formatoptions< textwidth< colorcolumn<"
setlocal spell formatoptions-=o textwidth=72 colorcolumn=+1

nnoremap <buffer> <unique> <leader>z 1z=
let b:undo_ftplugin .= " | nunmap <buffer> <leader>z"

hi! link VimwikiBold String
hi! link VimwikiItalic Character
hi! link VimwikiBoldItalic Function
hi! link VimwikiHeaderChar Title
