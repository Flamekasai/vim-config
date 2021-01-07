if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

silent! vunmap <buffer> +
silent! nunmap <buffer> +

nmap <silent><buffer> ,s <Plug>VimwikiToggleListItem
nmap <silent><buffer> ,d <Plug>VimwikiDecrementListItem
nmap <silent><buffer> ,f <Plug>VimwikiIncrementListItem

let b:undo_ftplugin .= '|nunmap <silent><buffer> ,s'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,d'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,f'
