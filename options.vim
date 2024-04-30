" TODO look in windows for shellslash category and check completeslash

" TODO check all the posible cpoptions
set cpoptions=aABceFs

" MOVING AROUND, SEARCHING AND PATTERNS

set whichwrap=b,s
set nostartofline
set incsearch
set ignorecase
set smartcase

" DISPLAYING TEXT

set nowrap
set fillchars=
set lazyredraw
set listchars=eol:$,tab:>\ ,trail:-,nbsp:+,precedes:<,extends:>
set number
set relativenumber

" SYNTAX, HIGHLIGHTING AND SPELLING

set nohlsearch
set nocursorline
set spelllang=es,en

" MULTIPLE WINDOWS

if !has('nvim')
    set laststatus=2
    set ruler
    let &statusline=" %t %r %m%=%y %l:%L "
else
    set smoothscroll " TODO move to its place when both in vim and neovm
    set laststatus=2
    set statusline=%!utils#FlamekasaiStatusLine()
endif
set hidden
set nosplitbelow " TODO Maybe no
set nosplitright " TODO Maybe no

" USING THE MOUSE

set mouse=nvi
set mousem=popup_setpos

" MESSAGES AND INFO

set shortmess=finxoOtTAF
set showcmd
set belloff=all

" SELECTING TEXT

set selection=inclusive " TODO Maybe 'old'?

" EDITING TEXT

set noshowmatch
set nojoinspaces
set nrformats=bin,hex

" TABS AND INDENTING

set shiftwidth=4
set smarttab
set softtabstop=-1
set shiftround " TODO maybe no?
set smartindent
set expandtab
set autoindent

" READING AND WRITING FILES

set nomodeline
set fileformats=unix,dos
set autoread

" THE SWAP FILE

set swapfile

" COMMAND LINE EDITING

set wildmode=longest,list:full
set wildoptions=tagfile
set wildignorecase
set nowildmenu
set cmdwinheight=20 " Maybe default of 7?

" VARIOUS

set virtualedit=block " Maybe a mapping that toggles '' and 'all'
set signcolumn=yes

" COLORSCHEMES AND SIGNS

colorscheme solarized8_flat

sign define DiagnosticSignInfo    text=┃ texthl=DiagnosticSignInfo
sign define DiagnosticSignHint    text=┃ texthl=DiagnosticSignHint
sign define DiagnosticSignWarn    text=┃ texthl=DiagnosticSignWarn
sign define DiagnosticSignWarning text=┃ texthl=DiagnosticSignWarning
sign define DiagnosticSignError   text=┃ texthl=DiagnosticSignError
