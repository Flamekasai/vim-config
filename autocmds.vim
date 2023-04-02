augroup CustomFT
    au! CustomFT
    autocmd BufNewFile,BufRead *.aspx set ft=aspx
    autocmd BufNewFile,BufRead *.pl set ft=prolog
    autocmd BufNewFile,BufRead *.asm set ft=asm
    autocmd BufNewFile,BufRead *.colors set ft=colors
augroup END

augroup RemoveTrailingWS
    autocmd! RemoveTrailingWS
    autocmd BufWrite * call utils#StripTrailingWhitespace()
augroup END

augroup ChangeHighlights
    autocmd! ChangeHighlights
    autocmd Colorscheme base16-* hi! link LineNr Normal
    autocmd Colorscheme * call utils#ChangeHighlights()
augroup END

augroup RandomColorscheme
    autocmd! RandomColorscheme
    if (enable_random_colors == 1)
        au VimEnter * call utils#GetRandomColorscheme()
    end
augroup END

" vim:set ft=vim et sw=4 foldmethod=marker nowrap fo=cql:
