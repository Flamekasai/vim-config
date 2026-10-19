autocmd Colorscheme,Syntax * call utils#ChangeHighlights()

autocmd Syntax * syntax match TrailingWhiteSpace /\s\+$/
autocmd BufWritePre * call utils#RemoveTrailingWhitespace()

autocmd FileType vimwiki set syntax=pandoc

" Custom filetypes
autocmd BufRead,BufNewFile *.colors set filetype=colors
