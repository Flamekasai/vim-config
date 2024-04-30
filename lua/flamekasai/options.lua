-- DISPLAYING TEXT

vim.opt.wrap = false
vim.opt.lazyredraw = true
vim.opt.number = true
vim.opt.relativenumber = true

-- SYNTAX, HIGHLIGHTING AND SPELLING

vim.opt.hlsearch = false
vim.opt.cursorline = true
vim.opt.spelllang = 'es,en'

-- MULTIPLE WINDOWS

vim.opt.laststatus = 3
vim.opt.statusline = '%!FlamekasaiStatusLine()'
vim.opt.splitbelow = true
vim.opt.splitright = true

-- MESSAGES AND INFO

vim.opt.showmode = false
vim.opt.shortmess = 'finxoOtTAF'

-- SELECTING TEXT

vim.opt.selection = 'inclusive' -- Maybe 'old'?

-- EDITING TEXT

vim.opt.showmatch = true

-- TABS AND INDENTING

vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.shiftround = true
vim.opt.expandtab  = true
vim.opt.autoindent = true
vim.opt.smartindent = false -- Maybe true?

-- READING AND WRITING FILES

vim.opt.modeline = false
vim.opt.fileformats = 'unix,dos'

-- THE SWAP FILE

vim.opt.swapfile = true -- Maybe not

-- COMMAND LINE EDITING

vim.opt.wildmode='full';
vim.opt.cmdwinheight = 20 -- Maybe default of 7?

-- VARIOUS

vim.opt.virtualedit = 'block' -- Maybe a mapping that toggles '' and 'all'
vim.opt.signcolumn = 'yes'

-- COLORSCHEMES AND SIGNS

vim.cmd.colorscheme('base16-catppuccin')

vim.cmd.sign('define DiagnosticSignInfo text=┃ texthl=DiagnosticSignInfo')
vim.cmd.sign('define DiagnosticSignHint text=┃ texthl=DiagnosticSignHint')
vim.cmd.sign('define DiagnosticSignWarn text=┃ texthl=DiagnosticSignWarn')
vim.cmd.sign('define DiagnosticSignWarning text=┃ texthl=DiagnosticSignWarning')
vim.cmd.sign('define DiagnosticSignError text=┃ texthl=DiagnosticSignError')
