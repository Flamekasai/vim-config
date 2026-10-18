nnoremap <leader>s          <cmd>write<cr>

if !has('nvim')
    nnoremap Y                  y$
    nnoremap [a                 <cmd>previous<cr>
    nnoremap ]a                 <cmd>next<cr>
    nnoremap [A                 <cmd>first<cr>
    nnoremap ]A                 <cmd>last<cr>
    nnoremap <expr> [<space>    "m'" .. v:count1 .. "O<esc>0D``"
    nnoremap <expr> ]<space>    "m'" .. v:count1 .. "o<esc>0D``"
endif

nnoremap [e                 :move -2<cr>
nnoremap ]e                 :move +1<cr>

nnoremap <c-k>              <cmd>cprevious<cr>zvzz
nnoremap <c-j>              <cmd>cnext<cr>zvzz

nnoremap g/                 :vim /

nnoremap [h                 <cmd>set hlsearch! <bar> echo "highlight search = " .. (&hlsearch ? 'on' : 'off')<cr>

xnoremap <c-k>              :move '<-2<cr>gv=gv
xnoremap <c-j>              :move '>+1<cr>gv=gv

inoremap <c-b>              <c-g>u{<cr>}<c-o>O<c-g>u

" Plugin mappings
if exists('g:plugin_fugitive_loaded')
    nnoremap <leader>gs <cmd>Git<cr>
endif

if exists('g:plugin_telescope_loaded')
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fg <cmd>Telescope git_files<cr>
    nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
else
    nnoremap <leader>fb :b<space>
endif

" Hard coded, dont know a way to conditionaly check for netrw existence
let g:plugin_netrw_loaded = 1
if exists('g:plugin_netrw_loaded')
    nnoremap <leader>e  <cmd>Explore<cr>
endif

nnoremap <leader>vh <cmd>execute 'e ' .. g:vim_path<cr>
nnoremap <leader>vo <cmd>execute 'e ' .. g:vim_path .. '/options.vim'<cr>
nnoremap <leader>vm <cmd>execute 'e ' .. g:vim_path .. '/mappings.vim'<cr>

if exists('g:plugin_vimwiki_loaded')
    nnoremap <leader>w <cmd>VimwikiIndex<cr>
endif
