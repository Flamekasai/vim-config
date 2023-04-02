set noshellslash
call plug#begin("~/vim-config/vimfiles/plugged")

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp',     { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer',   { 'branch': 'main' }
Plug 'hrsh7th/cmp-path',     { 'branch': 'main' }
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'vimwiki/vimwiki'

Plug 'gruvbox-community/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-conf-live/vimconflive2021-colorscheme'
call plug#end()
set shellslash

