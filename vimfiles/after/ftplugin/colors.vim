if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

nnoremap <silent> <buffer> J jyy:colorscheme <C-R>0<CR>
nnoremap <silent> <buffer> K kyy:colorscheme <C-R>0<CR>
nnoremap <silent> <buffer> L yy:colorscheme <C-R>0<CR>
nmap <silent> <buffer> <CR> L

let b:undo_ftplugin .= 'unmap <silent> <buffer> J'
let b:undo_ftplugin .= '|unmap <silent> <buffer> K'
let b:undo_ftplugin .= '|unmap <silent> <buffer> L'
let b:undo_ftplugin .= '|unmap <silent> <buffer> <CR>'
