let vim_path = expand('<sfile>:p:h')

" single, double, rounded, solid, shadow, none
let border_type = 'rounded'

let transparent_bg = v:false

let mapleader = ' '
let maplocalleader = '\\'

" SETUP PATHS (REMOVE DEFAULT CONFIG PATH AND ADD CUSTOM)
if has('nvim')
    let s:config_path = stdpath('config')
else
    let s:config_path = $HOME .. '/.vim'
endif
let s:rtp = split(&runtimepath, ',')
call filter(s:rtp, 'v:val !~  s:config_path')
call insert(s:rtp, g:vim_path)
call add(s:rtp, g:vim_path)
call add(s:rtp, g:vim_path .. '/after')
if !has('nvim')
    call add(s:rtp, g:vim_path .. '/lazy/gruvbox')
    call add(s:rtp, g:vim_path .. '/lazy/vim-solarized8')
endif
let &runtimepath = join(s:rtp, ',')
unlet s:rtp
unlet s:config_path

set nocompatible
syntax on
filetype plugin indent on

if has('nvim')
    lua require('flamekasai.plugins')
endif

execute 'source ' .. g:vim_path .. '/options.vim'
execute 'source ' .. g:vim_path .. '/autocommands.vim'
execute 'source ' .. g:vim_path .. '/mappings.vim'
