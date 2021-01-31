if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <silent> <buffer> J jyy:colorscheme 0<CR>
nnoremap <silent> <buffer> K kyy:colorscheme 0<CR>
nnoremap <silent> <buffer> l yy:colorscheme 0<CR>

let b:undo_ftplugin .= '|unmap <buffer> J'
let b:undo_ftplugin .= '|unmap <buffer> K'
let b:undo_ftplugin .= '|unmap <buffer> l'
