if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nmap <silent><buffer> ,s <Plug>VimwikiToggleListItem
nmap <silent><buffer> ,d <Plug>VimwikiDecrementListItem
nmap <silent><buffer> ,f <Plug>VimwikiIncrementListItem

" Cosas de apuntes de clase

setlocal spell
setlocal comments=s:>,m:>,e:>
setlocal formatoptions+=c
setlocal fillchars=vert:¦,eob:\ ,fold:-
setlocal colorcolumn=+1

nnoremap <buffer> <leader>z 1z=
nnoremap <buffer> <leader>p <cmd>!pandoc --defaults ../../Pandoc/to_html.yml --metadata-file meta.yml --css ../../Pandoc/gruvbox.css -o apuntes.html presentacion.md Teoria/tema?.md<cr>
nnoremap <buffer> <leader>ll :lv /^#/j % \| lw \| llast<CR><C-o>
nnoremap <buffer> <leader>la :lv /^#/j ## \| lw \| llast<CR><C-o>
nnoremap <buffer> [ot :set formatoptions+=t<CR>
nnoremap <buffer> ]ot :set formatoptions-=t<CR>

" inoremap <buffer> <C-k> <C-k>

let b:undo_ftplugin .= 'nunmap <silent><buffer> ,s'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,d'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,f'
let b:undo_ftplugin .= '|set spell<'
let b:undo_ftplugin .= '|set comments<'
let b:undo_ftplugin .= '|set fillchars<'
let b:undo_ftplugin .= '|set colorcolumn<'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>z'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>p'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>ll'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>la'
let b:undo_ftplugin .= '|nunmap <buffer> [ot'
let b:undo_ftplugin .= '|nunmap <buffer> ]ot'
" let b:undo_ftplugin .= '|iunmap <buffer> <C-k>'
