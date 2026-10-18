autocmd Colorscheme,Syntax * call utils#ChangeHighlights()

autocmd BufWritePre * call utils#RemoveTrailingWhitespace()

autocmd FileType vimwiki set syntax=pandoc

" Custom filetypes
autocmd BufRead,BufNewFile *.colors set filetype=colors

if has('nvim')
    autocmd LspAttach * call utils#OnLspChange(v:true)
    autocmd LspDetach * call utils#OnLspChange(v:false)
endif
