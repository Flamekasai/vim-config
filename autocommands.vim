augroup FlamekasaiAutocommands
    autocmd! FlamekasaiAutocommands
        if (g:random_colors != 'none')
            autocmd VimEnter * call utils#SetRandomColorscheme(g:random_colors)
        endif
        autocmd VimEnter * command -complete=custom,utils#RandomColorsCompletion -nargs=? RandomColorscheme call utils#SetRandomColorscheme(<q-args>)
    if has('nvim')
        autocmd VimEnter,Colorscheme * lua require('flamekasai.utils').colorize_statusline()
    endif
    autocmd Colorscheme * call utils#ChangeHighlights()
    autocmd BufWritePre * call utils#RemoveTrailingWhitespace()

    " Custom filetypes
    autocmd BufRead,BufNewFile *.colors set filetype=colors

    autocmd FileType vimwiki set syntax=pandoc
augroup END
