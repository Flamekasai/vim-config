augroup FlamekasaiAutocommands
    if has('nvim')
        autocmd VimEnter,Colorscheme * lua require('flamekasai.utils').colorize_statusline()
    endif
    autocmd Colorscheme * call utils#ChangeHighlights()
    autocmd BufWritePre * call utils#RemoveTrailingWhitespace()

    " Custom filetypes
    autocmd BufRead,BufNewFile *.colors set filetype=colors

    autocmd FileType vimwiki set syntax=pandoc
augroup END
