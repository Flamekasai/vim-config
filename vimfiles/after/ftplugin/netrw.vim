if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <silent><buffer> <C-L> <C-W><C-L>
nmap <silent><buffer> <C-R> <Plug>NetrwRefresh

let b:undo_ftplugin .= '|nunmap <silent><buffer> <C-L>'
let b:undo_ftplugin .= '|nunmap <silent><buffer> <C-R>'
