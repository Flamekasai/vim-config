if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <silent> <buffer> J jyy:colorscheme <C-R>0<CR>
nnoremap <silent> <buffer> K kyy:colorscheme <C-R>0<CR>
nnoremap <silent> <buffer> l yy:colorscheme <C-R>0<CR>

let b:undo_ftplugin .= '|unmap <buffer> J'
let b:undo_ftplugin .= '|unmap <buffer> K'
let b:undo_ftplugin .= '|unmap <buffer> l'
