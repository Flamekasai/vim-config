function! utils#StripTrailingWhitespace() abort
  if !&binary && &filetype != 'diff'
    let s:oldSearchRegister=@/
    %s/\s\+$//ce
    let @/=s:oldSearchRegister
    unlet s:oldSearchRegister
  endif
endfunction

function! utils#MyTabLine() abort
    let s = ''
    for i in range(tabpagenr('$'))
        let s .= '%#TabLineFill# '
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel# '
        else
            let s .= '%#TabLine# '
        endif
        let s .= i + 1
        let buffersInTab = tabpagebuflist(i + 1)
        let firstBufferInTab = bufname(buffersInTab[0])
        let s .= (getbufvar(buffersInTab[tabpagewinnr(i + 1) - 1], "&mod")?' [+] ':' ')
        if empty(firstBufferInTab)
            let firstBufferInTab="[Sin Nombre]"
        else
            let firstBufferInTab = fnamemodify(firstBufferInTab, ':t')
        endif
        let s .= firstBufferInTab . ' '
    endfor
    let s .= '%#TabLineFill#%T'
    return s
endfunction

function! utils#MyStatusLine() abort
    let s = ''
    let s .= ' %f %q%w%h%r%m '
    let s .= '%='
    let s .= '%#StatusLineTerm# '
    if exists('g:loaded_fugitive') && !empty(FugitiveStatusline())
        let s .= '%{fugitive#statusline()} '
    endif
    let s .= '%y %c:%l/%L (%p%%) '
    return s
endfunction

function! utils#GetRandomColorscheme()
    let randomOffset = 0
    let favouriteColors = []

    if has('win32')
        let favouriteColors = readfile(expand('$HOME') . '/vim-config/vimfiles/favouriteColors.txt')
        let randomOffset = system('echo %random%')
    elseif has('unix')
        let favouriteColors = readfile(expand('~') . '/vim-config/vimfiles/favouriteColors.txt')
        let randomOffset = system('echo $RANDOM')
    endif

    let limit = len(favouriteColors)
    let randomOffset = randomOffset % limit
    execute 'colorscheme ' . favouriteColors[randomOffset]

    if (g:colors_name == 'base16-papercolor-dark')
        hi! link LineNr WarningMsg
        hi! link CursorLineNr SpecialKey
        hi! link StatusLine TermCursor
        hi! link StatusLineNC TermCursorNC
        hi! link SignColumn LineNr
        hi! link VertSplit Normal
        syn sync fromstart
    endif

    echo g:colors_name
endfunction
