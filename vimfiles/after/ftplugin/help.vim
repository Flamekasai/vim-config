if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <silent><buffer>J /\(^\s*\u\{2,\}\\|^=\+$\)/<CR>zt
nnoremap <silent><buffer>K ?\(^\s*\u\{2,\}\\|^=\+$\)?<CR>zt

let b:undo_ftplugin .= '|nunmap <silent><buffer> J'
let b:undo_ftplugin .= '|nunmap <silent><buffer> K'
