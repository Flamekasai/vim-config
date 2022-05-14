if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

if (!empty(mapcheck('+', 'v')))
    silent! vunmap <buffer> +
endif

if (!empty(mapcheck('+', 'n')))
    silent! nunmap <buffer> +
endif

nmap <silent><buffer> ,s <Plug>VimwikiToggleListItem
nmap <silent><buffer> ,d <Plug>VimwikiDecrementListItem
nmap <silent><buffer> ,f <Plug>VimwikiIncrementListItem

" Cosas de apuntes de clase

setlocal spell spelllang=en,es comments=s:>,m:>,e:> fo+=c nonu nornu fillchars=vert:¦,eob:\ ,fold:-

nnoremap <buffer> <leader>z 1z=
nnoremap <buffer> <leader>p :Dispatch! pandoc -o %:r.pdf %<CR>
nnoremap <buffer> <leader>ll :lv /^#/j % \| lw \| llast<CR><C-o>
nnoremap <buffer> <leader>la :lv /^#/j ## \| lw \| llast<CR><C-o>
nnoremap <buffer> [ot :set formatoptions+=t<CR>
nnoremap <buffer> ]ot :set formatoptions-=t<CR>

inoremap <buffer> <C-k> <C-k>
nnoremap <buffer> <Tab> gn<C-g>
inoreabbrev <buffer> overl \overline{}<left>
inoreabbrev <buffer> inter \cap
inoreabbrev <buffer> union \cup
inoreabbrev <buffer> fr \frac{++}{++} ++<esc>?++<CR>nngn<C-g>
inoreabbrev <buffer> combi \left(\begin{matrix}++ \\++\end{matrix}\right)<esc>?++<CR>ngn<C-g>


let b:undo_ftplugin .= 'nunmap <silent><buffer> ,s'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,d'
let b:undo_ftplugin .= '|nunmap <silent><buffer> ,f'
let b:undo_ftplugin .= '|set spell<'
let b:undo_ftplugin .= '|set spelllang<'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>z'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>p'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>ll'
let b:undo_ftplugin .= '|nunmap <buffer> <leader>la'
let b:undo_ftplugin .= '|nunmap <buffer> [ot'
let b:undo_ftplugin .= '|nunmap <buffer> ]ot'
let b:undo_ftplugin .= '|iunmap <buffer> <C-k>'
let b:undo_ftplugin .= '|nunmap <buffer> <Tab>'
let b:undo_ftplugin .= '|iunabbrev <buffer> overl'
let b:undo_ftplugin .= '|iunabbrev <buffer> inter'
let b:undo_ftplugin .= '|iunabbrev <buffer> union'
let b:undo_ftplugin .= '|iunabbrev <buffer> fr'
let b:undo_ftplugin .= '|iunabbrev <buffer> combi'
