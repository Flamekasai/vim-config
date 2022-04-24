" Disable trying to be vi-compatible. ( default )
if &compatible
    set nocompatible
endif

" Set folders to use vim-config folder ( git )
set runtimepath^=$HOME/vim-config/vimfiles
set runtimepath+=$HOME/vim-config/vimfiles/after
let &packpath=&runtimepath

augroup CustomFT
    au!
    autocmd BufNewFile,BufRead *.aspx set ft=aspx
    autocmd BufNewFile,BufRead *.pl set ft=prolog
    autocmd BufNewFile,BufRead *.asm set ft=asm
    autocmd BufNewFile,BufRead *.colors set ft=colors
augroup END

" === Plugins ================================== {{{

    set noshellslash
    call plug#begin("~/vim-config/vimfiles/plugged")

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-dispatch'

    Plug 'neovim/nvim-lspconfig'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'preservim/nerdtree'
    Plug 'sheerun/vim-polyglot'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'godlygeek/tabular'
    Plug 'mattn/emmet-vim'
    Plug 'vimwiki/vimwiki'

    Plug 'gruvbox-community/gruvbox'
    Plug 'chriskempson/base16-vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'vim-conf-live/vimconflive2021-colorscheme'
    call plug#end()
    set shellslash

" ========================================== }}}

" Set leader key for custom commands on <Space>
let mapleader=" "

" === Moving around, searching and patterns =================================== {{{

    " ** Enables fuzzy file searching.
    set path=.,,

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

    " Set languages to use when spell is activated.
    set spelllang=en,es

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

    " Split more naturally (right or below
    set splitright splitbelow

" ======================================================= }}}

" === Multiple tab pages ================================== {{{

    " Custom tab line
    set tabline=%!utils#MyTabLine()

" ========================================================= }}}

" === Messages and info ================================== {{{

    " Show partial comands while typing them.
    set showcmd

    " Don't show mode is already in statusline
    set noshowmode

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

    " Always show signcolumn
    " This is to avoid appearing / disappearing
    set signcolumn=yes

" ======================================================== }}}

" === Editing text and completion ================================== {{{

    " What can backspace delete.
    set backspace=indent,eol,start

    " Set max width of lines
    set textwidth=72

    " Formating ( Change as needed ) options for info :help fo-table
    set formatoptions-=o
    set formatoptions+=j

    " Options for complete menu on file.
    set completeopt=menu,menuone,noselect

    " Set functions to omnicompletion.
    set omnifunc=syntaxcomplete#Complete

    " Make completion files use linux bars.
    set shellslash

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
    set foldmethod=syntax
    set foldlevelstart=99

    " Set fold marks to be on line number space.
    set foldcolumn=0 " No fold column.

" ============================================== }}}

" === Diff mode ================================== {{{

    " Added vertical to make diffs always open vertical.
    set diffopt=internal,filler,closeoff,vertical,algorithm:patience

" ============================================== }}}

" === Reading and writing files ================================== {{{

    " Vim info file. for Reference -> 'viminfo'
    if has('nvim')
        execute "set viminfo=\'100,<50,s10,h,rA:,rB:,n" . substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/tmpfiles/viminfoNvim'
    else
        execute "set viminfo=\'100,<50,s10,h,rA:,rB:,n" . substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/tmpfiles/viminfo'
    endif

    " Always save .swp files on vimfiles swp folder
    set noswapfile
    execute 'set directory^=' . substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/tmpfiles//'

    " Autoread a file when it's changed outside vim.
    set autoread

    " Save views on tmpfiles directory.
    if has('mksession')
        execute 'set viewdir=' . substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/tmpfiles/views'
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
    set wildmode=full

" =========================================================== }}}

" === GUI ================================== {{{

    " Set GUI Options.
    set guioptions=gck

    " Setting the font.
    set guifont=Consolas:h14:cANSI:qDRAFT

    " Allow use of touchscreen.
    set mouse=a

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

    " Use + and _ to paste easy from clipboard
    nnoremap + "+p
    nnoremap _ "+P

    " Make Y act as D and C and all the capitals
    nnoremap Y y$

    " Remap CTRL-HJKL to move between windows.
    nnoremap <C-H> <C-W>h
    nnoremap <C-J> <C-W>j
    nnoremap <C-K> <C-W>k
    nnoremap <C-L> <C-W>l

    " Make * search for selection in visual mode
    xnoremap * y/\<<C-R>0\><CR>
    xnoremap g* y/<C-R>0<CR>
    xnoremap # y?\<<C-R>0\><CR>
    xnoremap g# y?<C-R>0<CR>

    " Make + paste from clipboard substituting the selection
    " Make _ copy selected things to the clipboard
    xnoremap + "+p
    xnoremap _ "+y

    " Make undo point before deleting wole edit or word
    inoremap <C-U> <C-G>u<C-U>
    inoremap <C-W> <C-W>u<C-W>

    " Completion mappings
    inoremap <expr> <C-J> pumvisible() ? '<C-N>' : '<C-J>'
    inoremap <expr> <C-K> pumvisible() ? '<C-P>' : '<C-K>'

    " === Leader key mappings ================================== {{{

        " File navigation mapings
        nnoremap <leader>fl :NERDTreeToggle<CR>
        nnoremap <leader>ft :NERDTree<space>
        nnoremap <leader>ff :Telescope find_files<CR>
        nnoremap <leader>fb :Telescope buffers<CR>
        nnoremap <leader>fg :Telescope git_files<CR>
        nnoremap <silent> <leader>fi :e $HOME/vim-config/_vimrc<CR>
        " FuGITive mappings
        nnoremap <silent> <leader>gs :G<CR>

        " Save easy with leader + s
        nnoremap <leader>s :w<CR>

        " Buffer manipulation mappings
        nnoremap <leader>bl :ls!<CR>
        nnoremap <leader>bt :tabs<CR>
        nnoremap <leader>bw :bw!<CR>
        nnoremap <leader>bW :%bw!<CR>

        " LSP
        augroup LSP
            autocmd! LSP
            autocmd Colorscheme base16-* hi! link LineNr Normal
            autocmd Colorscheme * hi! link SignColumn LineNr | hi! clear FloatBorder | hi! link FloatBorder Pmenu
            autocmd Colorscheme * hi! link DiagnosticSignError DiagnosticError
            autocmd Colorscheme * hi! link DiagnosticSignWarn DiagnosticWarn
            autocmd Colorscheme * hi! link DiagnosticSignHint DiagnosticHint
            autocmd Colorscheme * hi! link DiagnosticSignInfo DiagnosticInfo
        augroup END

        " Vimwiki
        nnoremap <silent> <leader>ww :VimwikiIndex<CR>

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

    " Change certain highlight to all colorschemes
    let g:enable_transparent_bg = 0
    augroup ChangeHighlights
        autocmd! ChangeHighlights
        autocmd Colorscheme * call utils#ChangeHighlights()
    augroup END

    let enable_random_colors = 0
    augroup RandomColorscheme
        autocmd! RandomColorscheme
        if (enable_random_colors == 1)
            au VimEnter * :call utils#GetRandomColorscheme()
        else
            let g:gruvbox_italic=1
            colorscheme gruvbox
        endif
    augroup END

" ============================================== }}}

" Source project custom settings.
silent! so .vim/.exrc

" GUI options (neovide)
set guioptions=Pe
set guifont=Victor\ Mono:h18:cANSI:qDRAFT

" vim:set ft=vim et sw=4 foldmethod=marker nowrap fo=cql:
