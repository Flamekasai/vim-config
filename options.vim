" Options set with autocommand get in the group started by init.vim and
" need to be autocommands cause filetype plugins override them

set cpoptions=aABceFs " Vi compatibility options

" -------------------------------------
" MOVING AROUND, SEARCHING AND PATTERNS
" -------------------------------------

set path=.,,
set ignorecase
set smartcase

" ---------------
" DISPLAYING TEXT
" ---------------

set smoothscroll
set linebreak
set showbreak=...
set list
set listchars=tab:>\ ,trail:-,nbsp:+,precedes:<,extends:>
set number
set relativenumber
set conceallevel=0 " @Testing
autocmd FileType * set conceallevel<

" ---------------------------------
" SYNTAX, HIGHLIGHTING AND SPELLING
" ---------------------------------

" set nohlsearch " @Testing
set termguicolors
" set cursorline " @Testing
set cursorlineopt=screenline,number " @Testing
set spelllang=es,en
" TODO configure spell file to be in config folder and other spell options
" after spelllang

" ----------------
" MULTIPLE WINDOWS
" ----------------

let &laststatus = has('nvim') ? 3 : 2 " @Testing
set statusline=%!utils#FlamekasaiStatusLine()
set winborder=rounded

" -----------------
" MESSAGES AND INFO
" -----------------

set shortmess=oOtTA
set belloff=all

" --------------
" SELECTING TEXT
" --------------

set selection=old " @Testing With this selection mode you cannot select the end of line invisible character

" ------------
" EDITING TEXT
" ------------

set undofile " @Testing Persist undo data between sessions
autocmd Filetype * set formatoptions-=r formatoptions -=o
set completeopt=menu,preview " @Testing test preview when lsp is configured, it has no effect on normal completions it seems
set pumheight=5 " @Testing
let &pumborder=&winborder
set showmatch " @Testing

" ------------------
" TABS AND INDENTING
" ------------------

set shiftwidth=4
set softtabstop=-1
set shiftround
set expandtab
set autoindent
set smartindent

" "cinoptions" and "cinkeys" get overriden by ftplugins and different
" languages could have different values so autocommand for all filetypes
" is not usefull here so set them in after/ftplugin/{language}.vim
" not here (also remember to turn on "cindent" in the plugin too).
"
" The values i like right now are :
"   cinoptions=l1,b1,(0,u0,W1s,m1,j1,J1
"   cinkeys=0{,0},0),0],:,!^F,o,O,e,0=break

" -------------------------
" READING AND WRITING FILES
" -------------------------

set nomodeline
set autoread

" -------------
" THE SWAP FILE
" -------------

set swapfile

" --------------------
" COMMAND LINE EDITING
" --------------------

set wildmode=full " @Bug list is broken in 0.12 so if there is only one match it doesn't complete so use ctrl+d when you want a list and turned on wildmenu for now
set wildignorecase
set wildmenu
set cmdwinheight=20 " Maybe default of 7?

" ---------------------------------------------
" RUNNING MAKE AND JUMPING TO ERRORS (QUICKFIX)
" ---------------------------------------------

" set grepformat+=%f " @Testing i did configure this for some reason but i don't remember

" -------
" VARIOUS
" -------

set signcolumn=yes

" ----------------
" FILETYPE OPTIONS
" ----------------

" If "conceallevel" is not 0, you can add this to show bold and underline
" asterisks independently of conceallevel or you can check other categories
" you can hide or show selectively.
"
" let g:pandoc#syntax#conceal#blacklist = ["block"]
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "sh", "cs"]

" ----------------------
" COLORSCHEMES AND SIGNS
" ----------------------

command -complete=custom,utils#RandomColorsCompletion -nargs=? RandomColorscheme call utils#SetRandomColorscheme(<q-args>)
colorscheme retrobox
