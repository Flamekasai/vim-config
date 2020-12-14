if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

if hasmapto('+', 'n') && hasmapto('+', 'v')
    vunmap <buffer> +
    nunmap <buffer> +
endif

nmap <silent><buffer> ,s <Plug>VimwikiToggleListItem
nmap <silent><buffer> ,d <Plug>VimwikiDecrementListItem
nmap <silent><buffer> ,f <Plug>VimwikiIncrementListItem

let b:undo_ftplugin .= '|nunmap <silent><buffer> ,s'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,d'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,f'
