if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <silent><buffer> gt :Ntree<CR>

let b:undo_ftplugin .= '|nunmap <silent><buffer> gt'
