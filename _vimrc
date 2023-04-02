" Disable trying to be vi-compatible. ( default )
if &compatible
    set nocompatible
endif

" Set folders to use vim-config folder ( git )
set runtimepath^=$HOME/vim-config/vimfiles
set runtimepath+=$HOME/vim-config/vimfiles/after
let &packpath=&runtimepath

source $HOME/vim-config/plugins.vim
source $HOME/vim-config/options.vim
source $HOME/vim-config/mappings.vim
source $HOME/vim-config/autocmds.vim

" vim:set ft=vim et sw=4 foldmethod=marker nowrap fo=cql:
