nnoremap <leader>s          <cmd>write<cr>

if !has('nvim-0.11') " This are default in neovim 0.11
    nnoremap Y                  y$
    nnoremap [a                 <cmd>previous<cr>
    nnoremap ]a                 <cmd>next<cr>
    nnoremap [A                 <cmd>first<cr>
    nnoremap ]A                 <cmd>last<cr>
    nnoremap <expr> [<space>    "m'" .. v:count1 .. "O<esc>``"
    nnoremap <expr> ]<space>    "m'" .. v:count1 .. "o<esc>``"
else
    " Unmap default nvim 0.11 lsp mappings
    nunmap  gri
    nunmap  grr
    xunmap  gra
    nunmap  gra
    nunmap  grn
endif

nnoremap [e                 :move -2<cr>
nnoremap ]e                 :move +1<cr>

nnoremap <c-k>              <cmd>cprevious<cr>zvzz
nnoremap <c-j>              <cmd>cnext<cr>zvzz

nnoremap g/                 :vim /

nnoremap [h                 <cmd>set hlsearch! <bar> echo "highlight search = " .. (&hlsearch ? 'on' : 'off')<cr>

" Maybe if you use ijump or [I a lot
" nnoremap [I :ilist <c-r><c-w><cr>:ijump <c-r><c-w><s-left><left><space>

if has('nvim')
    nnoremap <leader>ld         <cmd>lua vim.diagnostic.setqflist()<cr>
endif

" xnoremap K              :move '<-2<cr>gv=gv
" xnoremap J              :move '>+1<cr>gv=gv
xnoremap <c-k>              :move '<-2<cr>gv=gv
xnoremap <c-j>              :move '>+1<cr>gv=gv

inoremap <c-b>              <c-g>u{<cr>}<c-o>O<c-g>u

" Plugin mappings
if exists('loaded_fugitive')
    nnoremap <leader>gs <cmd>Git<cr>
endif

if exists('loaded_telescope')
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fg <cmd>Telescope git_files<cr>
    nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
else
    nnoremap <leader>fb :b<space>
endif

if exists('loaded_netrwPlugin')
    nnoremap <leader>e  <cmd>Explore<cr>
    nnoremap <leader>vh <cmd>execute 'e ' .. g:vim_path<cr>
endif
nnoremap <leader>vo <cmd>execute 'e ' .. g:vim_path .. '/options.vim'<cr>
nnoremap <leader>vm <cmd>execute 'e ' .. g:vim_path .. '/mappings.vim'<cr>

if exists('loaded_vimwiki')
    nnoremap <leader>w <cmd>VimwikiIndex<cr>
endif
