" Disable trying to be vi-compatible. ( default )
if &compatible
    set nocompatible
endif

" Set folders to use vim-config folder ( git )
set runtimepath^=$HOME/vim-config/vimfiles
set runtimepath+=$HOME/vim-config/vimfiles/after
let &packpath=&runtimepath

" Set only the messages in english
language messages en_US.utf8

" === Plugins ================================== {{{

    " Activating desired plugins.
    " packadd! vim-commentary
    " packadd! vim-fugitive
    " packadd! vim-repeat
    " packadd! vim-surround
    " packadd! vim-unimpaired
    " packadd! vim-dispatch
    " packadd! vim-tabular
    " packadd! vim-polyglot
    " packadd! vim-ctrlp
    " packadd! vim-emmet
    " packadd! vim-nerdtree
    " packadd! vim-wiki

    call plug#begin("~/vim-config/vimfiles/plugged")
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-dispatch'

    Plug 'godlygeek/tabular'
    Plug 'kien/ctrlp.vim'
    Plug 'mattn/emmet-vim'
    Plug 'preservim/nerdtree'
    Plug 'vimwiki/vimwiki'
    Plug 'sheerun/vim-polyglot'

    Plug 'gruvbox-community/gruvbox'
    Plug 'chriskempson/base16-vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'colepeters/spacemacs-theme.vim'
    call plug#end()

    " CtrlP
    let g:ctrlp_map=''
    nnoremap <silent> <C-P>p :CtrlP<CR>
    nnoremap <silent> <C-P>b :CtrlPBuffer<CR>
    nnoremap <silent> <C-P>m :CtrlPMRUFiles<CR>
    nnoremap <silent> <C-P>c :CtrlPCurWD<CR>

    " Emmet
    let g:user_emmet_install_global = 0
    augroup EmmetConfig
        autocmd! EmmetConfig
        autocmd FileType html,css,xml EmmetInstall
        autocmd FileType html,css,xml imap <Tab> <plug>(emmet-expand-abbr)
    augroup END
    let g:user_emmet_leader_key='<C-l>'

    " Netrw
    let g:netrw_altv=1 " Always open vertical split on right.
    let g:netrw_banner=0 " Hide netrw banner.
    let g:netrw_liststyle=0 " List style for directories. ( see :help g:netrw_liststyle )
    let g:netrw_use_errorwindow=0 " Errors shown in cmdline with echo -> 0 or on a new window -> 1
    let g:netrw_browse_split=0 " Open files in the previous window.

    " NerdTREE
    let NERDTreeHijackNetrw=0
    let NERDTreeBookmarksFile=expand('<sfile>:p:h') . "/vim-config/vimfiles/tmpfiles/.NERDTreeBookmarks"
    let NERDTreeDirArrowExpandable="+"
    let NERDTreeDirArrowCollapsible="-"

    " Vimwiki
    let g:vimwiki_list = [{'path': expand('<sfile>:p:h') . '/vim-config/vimfiles/vimwiki/folder1/',
                \ 'path_html': expand('<sfile>:p:h') . '/vim-config/vimfiles/vimwiki/folder1/html/',
                \ 'auto_export': 1}]
    let g:vimwiki_listsyms=' .oOx'

    set shellslash

    " ========================================== }}}

" Set leader key for custom commands on <Space>
let mapleader=" "

" === Moving around, searching and patterns =================================== {{{

    " ** Enables fuzzy file searching.
    set path=.,,**

    " Show matches while still searching.
    set incsearch

    " Ignore uppercase for searching.
    set ignorecase

    " Don't ignore uppercase on search with uppercase chars.
    set smartcase

    " Highlight all search matches. ( default )
    set nohlsearch

"  ============================================================================ }}}

" === Displaying text =================================== {{{

    " Wrap too long lines only visualy. ( default )
    set nowrap

    if has('linebreak')
        " Wrap lines in characters of breakat. ( just visual )
        set linebreak

        " Broke lines share indent.
        set breakindent
    endif

    " Prefix for lines that broke with wrap to see that they are broken lines.
    set showbreak=>>>

    " Margin from border to cursor.
    set scrolloff=1

    " Margin from Horizontal border to cursor.
    set sidescrolloff=5

    " Always show last line even if it doesn't fit.
    set display+=lastline

    " Set utf-8 encoding.
    set encoding=utf-8

    " Characters for custom hidden chars
    set listchars=tab:>\ ,trail:·,extends:»,precedes:«,eol:$

    " Characters for some decorations like vertical separator etc.
    set fillchars=vert:\¦,fold:-

    " Don't redraw screen inside macros.
    set lazyredraw

    " Show line number.
    set number
    set relativenumber

"  ==================================================== }}}

" === Syntax, highlighting and spelling =================================== {{{

    syntax on

    filetype plugin indent on

    " Use true color when supported.
    if has('termguicolors')
        set termguicolors
    endif

    " Adjust vim to see that window term can use 256 colors.
    if ($TERM == "win32")
        set t_Co=256
    endif

    " When add a word to either bad or good spelling adding a lowercaps word ads uppercaps too but adding uppercaps only adds upercaps.
    if has('syntax')
      set spellcapcheck=
    endif

"  ======================================================================== }}}

" === Multiple windows ================================== {{{

    " Always show status line. ( even with 1 window only )
    set laststatus=2

    " Try to reuse windows/tabs when switching buffers
    set switchbuf=usetab

    " Don't unload buffers if they are no longer shown in any window.
    set hidden

    " Custom status line
    set statusline=%!utils#MyStatusLine()

" ======================================================= }}}

" === Multiple tab pages ================================== {{{

    " Custom tab line
    set tabline=%!utils#MyTabLine()

" ========================================================= }}}

" === Messages and info ================================== {{{

    " Show partial comands while typing them.
    set showcmd

    " Defines how some messages are displayed.
    set shortmess=f
    set shortmess+=m
    set shortmess+=n
    set shortmess+=r
    set shortmess+=w
    set shortmess+=x
    set shortmess+=o
    set shortmess+=O
    set shortmess+=t
    set shortmess+=T
    set shortmess+=s
    set shortmess+=I
    set shortmess+=c

    " No beeps when you do something wrong.
    if exists('&belloff')
        set belloff=all
    endif

" ======================================================== }}}

" === Editing text and completion ================================== {{{

    " What can backspace delete.
    set backspace=indent,eol,start

    " Formating ( Change as needed ) options for info :help fo-table
    set formatoptions-=o
    set formatoptions+=j

    " Options for complete menu on file.
    set completeopt=menu,preview

    " Set functions to omnicompletion.
    set omnifunc=syntaxcomplete#Complete

    " Make completion files use linux bars.
    " activated after plug.vim has done it's work set shellslash

    " Remove octal interpretation
    set nrformats-=octal

    " Allow cursor to move where there is no text in visual block mode
    if has('virtualedit')
        set virtualedit=block
    endif

" ================================================================== }}}

" === Tabs and indenting ================================== {{{

    " Spaces for tabs. ( 8 for keeping compatibility with other editors )
    set tabstop=8

    " Spaces for indent ( 0 = tabstop value )
    set shiftwidth=4

    " Spaces that tabstop will simulate ( negative = shiftwith value )
    set softtabstop=-1

    " Force <tab> to always put spaces even if they are == tabstop
    set expandtab

    " Lines get previous line indentation.
    set autoindent

    " Round spaces to multiples of shiftwidth
    set shiftround

" ========================================================= }}}

" === Folding ================================== {{{

    " Interesting options: foldmethod, foldopen, and foldclose

    " Set fold marks to be on line number space.
    set foldcolumn=2

" ============================================== }}}

" === Diff mode ================================== {{{

    " Added vertical to make diffs always open vertical.
    "set diffopt=internal,filler,closeoff,vertical

" ============================================== }}}

" === Reading and writing files ================================== {{{

    " Vim info file. for Reference -> 'viminfo'
    execute "set viminfo=\'100,<50,s10,h,rA:,rB:,n" . expand('<sfile>:p:h') . '/vim-config/vimfiles/tmpfiles/viminfo'

    " Always save .swp files on vimfiles swp folder
    execute 'set directory^=' . expand('<sfile>:p:h') . '/vim-config/vimfiles/tmpfiles//'

    " Autoread a file when it's changed outside vim.
    set autoread

    " Save views on tmpfiles directory.
    if has('mksession')
        execute 'set viewdir=' . expand('<sfile>:p:h') . '/vim-config/vimfiles/tmpfiles/views'
        set viewoptions=folds,options,curdir
    endif

    " Session options for saving sessions to be readed from windows and linux.
    set sessionoptions+=unix,slash

" ================================================================ }}}

" === Command line editing ================================== {{{

    " Max command history entries.
    set history=1000

    " Display command completion in a little menu.
    set wildmenu

    " Options for complete menu on command line.
    set wildmode=longest,full

" =========================================================== }}}

" === GUI ================================== {{{

    " Set GUI Options.
    set guioptions=gck

    " Setting the font.
    set guifont=Consolas:h14:cANSI:qDRAFT

" ========================================== }}}

" === Language specific ================================== {{{

    " === Java ================================== {{{

        " More Hightlights in Java ( Move this to an ftplugin )
        let java_highlight_all = 1

        "yes" " Highlight all java functions.
        " let java_highlight_functions =

    " =========================================== }}}

" =================================================== }}}

" === Mappings ================================== {{{

    " Make undo point before deleting wole edit or word
    inoremap <C-U> <C-G>u<C-U>
    inoremap <C-W> <C-W>u<C-W>

    " Use : without pressing shift and ; pressing shift
    nnoremap : ;
    nnoremap ; :
    nnoremap q; q:

    " Substitute last search pattern easily
    nnoremap <S-S> :%s//

    " Make Y act as D and C and all the capitals
    nnoremap <S-Y> y$

    " Remap CTRL-HJKL to move between windows.
    nnoremap <C-H> <C-W>h
    nnoremap <C-J> <C-W>j
    nnoremap <C-K> <C-W>k
    nnoremap <C-L> <C-W>l

    nnoremap <C-W><S-B> :ls!<CR>
    nnoremap <C-W><C-B> :bw!<CR>

    " CTRL-Space in insert mode to extend abbreviations
    inoremap <C-Space> <C-]>

    " CTRL-Z to NERDTreeToggle
    nnoremap <C-Z> :NERDTreeToggle<CR>

    " Make * search for selection in visual mode
    xnoremap * y/\<<C-R>0\><CR>

    " Swap : and ; in visual mode too
    xnoremap : ;
    xnoremap ; :

    " === Leader key mappings ================================== {{{

        " Change buffer easily
        nnoremap <silent> <leader>b :CtrlPBuffer<CR>
        nnoremap <silent> <leader>gs :G<CR>

        " Save easy with leader + s
        nnoremap <leader>s :w<CR>

    " ====================================================== }}}

    " === Function key mappings ================================== {{{

        " Open help and make it the only window.
        nnoremap <silent> <F1> :0tab h<CR>

        " Clear hlsearch
        nnoremap <silent> <F2> :nohlsearch<CR>

        " Remove trailing whitespace manually.
        nnoremap <silent> <F3> :call utils#StripTrailingWhitespace()<CR>
        augroup RemoveTrailingWS
            autocmd! RemoveTrailingWS
            autocmd BufWrite * :call utils#StripTrailingWhitespace()
        augroup END

    " ====================================================== }}}

" =============================================== }}}

" === Colorscheme ================================== {{{

    " For dark terminal windows and hybrid colorschemes dark.
    set background=dark

    " Change search highlight
    augroup ChangeHighlights
        autocmd! ChangeHighlights

        autocmd ColorScheme * highlight clear Search | highlight Search term=underline cterm=underline ctermfg=14 gui=underline guifg=#bf5656
    augroup END

    " Actual coloscheme define.
    colorscheme gruvbox

" ============================================== }}}

" vim:set ft=vim et sw=4 foldmethod=marker nowrap fo=cql:
