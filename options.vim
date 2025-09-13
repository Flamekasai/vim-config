" TODO look in windows for shellslash category and check completeslash

" TODO Check all options for independency of defaults
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
set nolist
set listchars=eol:$,tab:>\ ,trail:-,nbsp:+,precedes:<,extends:>
set number
set relativenumber

" SYNTAX, HIGHLIGHTING AND SPELLING

set nohlsearch
set termguicolors
set cursorline
set spelllang=es,en

" MULTIPLE WINDOWS

set laststatus=2
set statusline=%!utils#FlamekasaiStatusLine()
set hidden
set nosplitbelow " TODO Maybe no
set nosplitright " TODO Maybe no

if has('nvim')
    set winborder=rounded
endif

" USING THE MOUSE

set mouse=nvi
set mousem=popup_setpos

" MESSAGES AND INFO

set shortmess=finxoOtTAF
set showcmd
set ruler
set belloff=all

" SELECTING TEXT

set selection=inclusive " TODO Maybe 'old'?

" EDITING TEXT

set completeopt=menu
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
set autoread

" THE SWAP FILE

set swapfile

" COMMAND LINE EDITING

" set wildmode=longest:list,full
set wildmode=full
set wildoptions=tagfile
set wildignorecase
" set nowildmenu
set wildmenu
set cmdwinheight=20 " Maybe default of 7?

" QUICKFIX

set grepformat+=%f

" VARIOUS

set virtualedit=block " Maybe a mapping that toggles '' and 'all'
set signcolumn=yes

" FILETYPE OPTIONS

let g:pandoc#syntax#codeblocks#embeds#use = 1
let g:pandoc#syntax#conceal#blacklist = ["block"]
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "sh"]
let g:pandoc#syntax#protect#codeblocks = 0

" COLORSCHEMES AND SIGNS

if exists('loaded_nvim_base16')
    " Posible values found in autoload/utils.vim:80
    command -complete=custom,utils#RandomColorsCompletion -nargs=? RandomColorscheme call utils#SetRandomColorscheme(<q-args>)
    colorscheme base16-gruvbox-dark-medium
endif

sign define DiagnosticSignInfo    text=┃ texthl=DiagnosticSignInfo
sign define DiagnosticSignHint    text=┃ texthl=DiagnosticSignHint
sign define DiagnosticSignWarn    text=┃ texthl=DiagnosticSignWarn
sign define DiagnosticSignWarning text=┃ texthl=DiagnosticSignWarning
sign define DiagnosticSignError   text=┃ texthl=DiagnosticSignError
