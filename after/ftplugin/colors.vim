if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1
let b:undo_ftplugin = "nunmap <buffer> L | nunmap <buffer> J | nunmap <buffer> K"

nnoremap <buffer><unique> L :colorscheme <c-r><c-l><cr>
nmap     <buffer><unique> J jL
nmap     <buffer><unique> K kL
