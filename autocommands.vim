augroup FlamekasaiAutocommands
    autocmd! FlamekasaiAutocommands
    if has('nvim')
        if (g:random_colors != 'none')
            autocmd VimEnter * call utils#SetRandomColorscheme(g:random_colors)
            if has('nvim-0.10.0')
                " Neovim added this mapping GLOBALLY for lsp.codeactions on
                " default mappings WTF
                autocmd VimEnter * nunmap crr
                autocmd VimEnter * vunmap crr
            endif
        endif
        autocmd VimEnter * command -nargs=? RandomColorscheme call utils#SetRandomColorscheme(<q-args>)
        autocmd VimEnter,Colorscheme * lua require('flamekasai.utils').colorize_statusline()
    endif
    autocmd Colorscheme * call utils#ChangeHighlights()
    autocmd BufWritePre * call utils#RemoveTrailingWhitespace()
    autocmd BufRead,BufNewFile *.colors set filetype=colors
augroup END
