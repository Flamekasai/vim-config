nnoremap <leader>s          <cmd>write<cr>
nnoremap Y                  y$

nnoremap [a                 <cmd>previous<cr>
nnoremap ]a                 <cmd>next<cr>
nnoremap [A                 <cmd>first<cr>
nnoremap ]A                 <cmd>last<cr>

nnoremap <expr> [<space>    "m'" .. v:count1 .. "O<esc>``"
nnoremap <expr> ]<space>    "m'" .. v:count1 .. "o<esc>``"
nnoremap [e                 :move -2<cr>
nnoremap ]e                 :move +2<cr>

nnoremap <c-k>              <cmd>cprevious<cr>zz
nnoremap <c-j>              <cmd>cnext<cr>zz

nnoremap g/                 :vim /

nnoremap [h                 <cmd>set hlsearch! <bar> echo "highlight search = " .. (&hlsearch ? 'on' : 'off')<cr>

" Maybe if you use ijump or [I a lot
" nnoremap [I :ilist <c-r><c-w><cr>:ijump <c-r><c-w><s-left><left><space>

nnoremap [d                 <cmd>lua vim.diagnostic.goto_prev()<cr>
nnoremap ]d                 <cmd>lua vim.diagnostic.goto_next()<cr>
nnoremap <leader>ld         <cmd>lua vim.diagnostic.setqflist()<cr>

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
else
    nnoremap <leader>fb <cmd>b<space>
endif

if exists('loaded_netrwPlugin')
    nnoremap <leader>e  <cmd>Explore<cr>
    nnoremap <leader>vh <cmd>execute 'e ' .. g:vim_path<cr>
endif
nnoremap <leader>vo <cmd>execute 'e ' .. g:vim_path .. '/options.vim'<cr>
nnoremap <leader>vm <cmd>execute 'e ' .. g:vim_path .. '/mappings.vim'<cr>

nnoremap <ScrollWheelUp> <c-y>
nnoremap <ScrollWheelDown> <c-e>
