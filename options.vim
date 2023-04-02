" Set leader key for custom commands on <Space>
let mapleader=" "
let g:enable_transparent_bg = 1
let g:enable_random_colors = 0

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
    set showbreak=

    " Margin from border to cursor.
    set scrolloff=1

    " Margin from Horizontal border to cursor.
    set sidescrolloff=5

    " Always show last line even if it doesn't fit.
    set display+=lastline

    " Set utf-8 encoding.
    set encoding=utf-8

    " Characters for custom hidden chars
    set listchars=tab:>\ ,trail:·,eol:$

    " Characters for some decorations like vertical separator etc.
    " set fillchars=vert:\¦,fold:-

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
    set spelllang=es,en
    execute 'set spellfile=' . substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/spell/dictionary.utf-8.add'

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

    " Split more naturally (right or below)
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
    set shortmess=fmnrwxoOtTsIc

    " No beeps when you do something wrong.
    set belloff=all

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
    set diffopt+=vertical,algorithm:patience

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
    set guioptions=gckPe

    " Setting the font.
    set guifont=Consolas:h14:cANSI:qDRAFT
    " set guifont=Victor\ Mono:h18:cANSI:qDRAFT

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

" === Colorscheme ================================== {{{

    " Define signs for diagnostics
    sign define DiagnosticSignError texthl=DiagnosticSignError numhl=DiagnosticSignError text=✕
    sign define DiagnosticSignWarn texthl=DiagnosticSignWarn numhl=DiagnosticSignWarn   text=⚠
    sign define DiagnosticSignInfo texthl=DiagnosticSignInfo numhl=DiagnosticSignInfo   text=🛈
    sign define DiagnosticSignHint texthl=DiagnosticSignHint numhl=DiagnosticSignHint   text=🛈

    " For dark terminal windows and hybrid colorschemes dark.
    set background=dark

    let g:gruvbox_italic=1
    colorscheme gruvbox

" ============================================== }}}

" vim:set ft=vim et sw=4 foldmethod=marker nowrap fo=cql:
