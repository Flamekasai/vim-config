if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <buffer>J /\(^\s*\u\{2,\}\\|^=\+$\)/<CR>zt
nnoremap <buffer>K ?\(^\s*\u\{2,\}\\|^=\+$\)?<CR>zt

let b:undo_ftplugin .= '|nunmap <buffer> J'
let b:undo_ftplugin .= '|nunmap <buffer> K'
