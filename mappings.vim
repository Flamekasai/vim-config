" === Mappings ================================== {{{

    " For specific filetype mappings check the after/ftplugin folder on vim-config/vimfiles

    " Easy escape
    xnoremap <C-H> <ESC>
    inoremap <C-H> <ESC>
    cnoremap <C-H> <C-C>
    tnoremap <C-H> <C-\><C-N>

    " Use : without pressing shift and ; pressing shift
    " This mapping works on Normal, Visual, Select and Operator-pending
    noremap : ;
    noremap ; :
    nnoremap q; q:

    " Make Y act as D and C and all the capitals
    nnoremap Y y$

    " Remap CTRL-HJKL to move between windows.
    nnoremap <C-H> <C-W>h
    nnoremap <C-J> <C-W>j
    nnoremap <C-K> <C-W>k
    nnoremap <C-L> <C-W>l

    " Make * search for selection in visual mode
    xnoremap * "-y/\<<C-R>-\><CR>
    xnoremap g* "-y/<C-R>-<CR>
    xnoremap # "-y?\<<C-R>-\><CR>
    xnoremap g# "-y?<C-R>-<CR>

    " Make _ copy selected things to the system clipboard
    xnoremap _ "+y

    " Make undo point before deleting wole edit or word
    inoremap <C-U> <C-G>u<C-U>
    inoremap <C-W> <C-W>u<C-W>

    " Completion mappings
    " inoremap <expr> <C-J> pumvisible() ? '<C-N>' : '<C-J>'
    " inoremap <expr> <C-K> pumvisible() ? '<C-P>' : '<C-K>'

    " === Leader key mappings ================================== {{{

        " File navigation mapings
        nnoremap <leader>fl <cmd>NERDTreeToggle<CR>
        nnoremap <leader>ft :<C-u>NERDTree<space>
        nnoremap <leader>ff <cmd>Telescope find_files<CR>
        nnoremap <leader>fb <cmd>Telescope buffers<CR>
        nnoremap <leader>fg <cmd>Telescope git_files<CR>
        nnoremap <silent> <leader>fo <cmd>e $HOME/vim-config/options.vim<CR>
        nnoremap <silent> <leader>fm <cmd>e $HOME/vim-config/mappings.vim<CR>
        nnoremap <silent> <leader>fp <cmd>e $HOME/vim-config/plugins.vim<CR>

        " FuGITive mappings
        nnoremap <silent> <leader>gs <cmd>G<CR>

        " Save easy with leader + s
        nnoremap <leader>s <cmd>w<CR>

        " Buffer manipulation mappings
        nnoremap <leader>bl <cmd>ls!<CR>
        nnoremap <leader>bt <cmd>tabs<CR>
        nnoremap <leader>bw <cmd>bw!<CR>
        nnoremap <leader>bW <cmd>%bw!<CR>

        " Vimwiki
        nnoremap <silent> <leader>ww <cmd>VimwikiIndex<CR>

    " ====================================================== }}}

    " === Function key mappings ================================== {{{

        " Open help and make it the only window.
        nnoremap <silent> <F1> <cmd>0tab h<CR>

        " Clear hlsearch
        nnoremap <silent> <F2> <cmd>nohlsearch<CR>

        " Remove trailing whitespace manually.
        nnoremap <silent> <F3> <cmd>call utils#StripTrailingWhitespace()<CR>
    " ====================================================== }}}

" =============================================== }}}

" vim:set ft=vim et sw=4 foldmethod=marker nowrap fo=cql:
