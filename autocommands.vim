augroup FlamekasaiAutocommands
    autocmd! FlamekasaiAutocommands
    if has('nvim')
        if (g:random_colors != 'none')
            autocmd VimEnter * call utils#SetRandomColorscheme(g:random_colors)
        endif
        autocmd VimEnter * command -nargs=? RandomColorscheme call utils#SetRandomColorscheme(<q-args>)
        autocmd VimEnter,Colorscheme * lua require('flamekasai.utils').colorize_statusline()

        if has('nvim-0.10.0')
            " Neovim added this mapping GLOBALLY for lsp.codeactions on
            " default mappings WTF
            echomsg "this works"
            autocmd VimEnter * nunmap crr
            autocmd VimEnter * nunmap crn
            autocmd VimEnter * vunmap crr
        endif
    endif
    autocmd Colorscheme * call utils#ChangeHighlights()
    autocmd BufWritePre * call utils#RemoveTrailingWhitespace()

    " Custom filetypes
    autocmd BufRead,BufNewFile *.colors set filetype=colors
augroup END
