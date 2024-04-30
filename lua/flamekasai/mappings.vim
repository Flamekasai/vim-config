" This file is a vimscript file because I find keymapings in vimscript to be
" more readable than in lua. In lua, mappings get mixed with all the
" parameters to the nvim_set_keymap function which are all strings so
" everything has the same colors and is hard to parse.

nnoremap <leader>s          <cmd>write<cr>
nnoremap Y                  y$

nnoremap [a                 <cmd>previous<cr>
nnoremap ]a                 <cmd>next<cr>
nnoremap [A                 <cmd>first<cr>
nnoremap ]A                 <cmd>last<cr>


nnoremap <expr> [<space>    "m'" .. v:count1 .. "O<esc>``"
nnoremap <expr> ]<space>    "m'" .. v:count1 .. "o<esc>``"

nnoremap <c-k>              <cmd>cprevious<cr>zz
nnoremap <c-j>              <cmd>cnext<cr>zz

nnoremap g/                 :vim /
" nnoremap [h                 <cmd>nohls<cr>
nnoremap [h                 <cmd>set hlsearch! <bar> echo "highlight search = " . (&hlsearch ? 'on' : 'off')<cr>

nnoremap [d                 <cmd>lua vim.diagnostic.goto_prev()<cr>
nnoremap ]d                 <cmd>lua vim.diagnostic.goto_next()<cr>
nnoremap <leader>ld         <cmd>lua vim.diagnostic.setqflist()<cr>

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
endif

if exists('loaded_netrwPlugin')
    nnoremap <leader>e <cmd>Explore<cr>
endif
