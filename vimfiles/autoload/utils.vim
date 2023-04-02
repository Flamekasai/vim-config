function! utils#StripTrailingWhitespace() abort
  if !&binary && &filetype != 'diff'
    let s:oldSearchRegister=@/
    %s/\s\+$//e
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
        " Comment This to only have numbers "
        "==================================="
        " let buffersInTab = tabpagebuflist(i + 1)
        " let firstBufferInTab = bufname(buffersInTab[0])
        " let s .= (getbufvar(buffersInTab[tabpagewinnr(i + 1) - 1], "&mod")?' [+] ':' ')
        " if empty(firstBufferInTab)
        "     let firstBufferInTab="[Sin Nombre]"
        " else
        "     let firstBufferInTab = fnamemodify(firstBufferInTab, ':t')
        " endif
        " let s .= firstBufferInTab . ' '
        "==================================="
    endfor
    let s .= '%#TabLineFill#%T'
    return s
endfunction

let g:mode_names = {
            \ 'n'      : 'normal',
            \ 'no'     : 'normal',
            \ 'nov'    : 'normal',
            \ 'noV'    : 'normal',
            \ 'no'   : 'normal',
            \ 'niI'    : 'normal',
            \ 'niR'    : 'normal',
            \ 'niV'    : 'normal',
            \ 'v'      : 'visual',
            \ 'V'      : 'v-line',
            \ ''     : 'v-block',
            \ 's'      : 'select',
            \ 'S'      : 's-line',
            \ ''     : 's-block',
            \ 'i'      : 'insert',
            \ 'ic'     : 'insert',
            \ 'ix'     : 'insert',
            \ 'R'      : 'replace',
            \ 'Rc'     : 'replace',
            \ 'Rv'     : 'v-replace',
            \ 'Rx'     : 'replace',
            \ 'c'      : 'command',
            \ 'cv'     : 'ex-mode',
            \ 'ce'     : 'ex-mode',
            \ 'r'      : 'hit-enter',
            \ 'rm'     : 'more',
            \ 'r?'     : 'confirm',
            \ '!'      : 'shell',
            \ 't'      : 'terminal',
            \ 'nt'     : 'terminal'
            \ }
function! utils#MyStatusLine() abort
    let s = ' '
    let s .= '[%{toupper(g:mode_names[mode("fullnames")])}]'
    let s .= '%='
    " Change %t to %.35f to have full path limited to 35 chars
    let s .= '%t %(%q%w%h%r%m%)'
    let s .= '%='
    if exists('g:loaded_fugitive') && !empty(FugitiveHead())
        let s .= '[%{FugitiveHead()}] '
    endif
    let s .= '%y '
    let s .= '%l:%L '
    return s
endfunction

function! utils#GetRandomColorscheme() abort
    let randomOffset = 0
    let favouriteColors = []

    let favouriteColors = readfile(expand('$HOME') . '/vim-config/vimfiles/favouriteColors.colors')
    let randomOffset = rand()

    let limit = len(favouriteColors)
    let randomOffset = randomOffset % limit
    execute 'colorscheme ' . favouriteColors[randomOffset]

    call utils#ChangeHighlights()

    echo g:colors_name
endfunction

function! utils#ChangeHighlights() abort
    hi! link SignColumn LineNr

    " Make floating and complete menus same color as background
    hi! clear FloatBorder
    hi! link FloatBorder Normal
    hi! link Pmenu Normal
    hi! link DiagnosticSignError DiagnosticError
    hi! link DiagnosticSignWarn DiagnosticWarn
    hi! link DiagnosticSignHint DiagnosticHint
    hi! link DiagnosticSignInfo DiagnosticInfo

    if (g:colors_name == 'base16-papercolor-dark')
        hi! link LineNr WarningMsg
        hi! link CursorLineNr SpecialKey
        hi! link StatusLine TermCursor
        hi! link StatusLineNC TermCursorNC
        hi! link TabLine TermCursorNC
        hi! link TabLineFill TermCursorNC
        hi! link TabLineSel TermCursor
        hi! link SignColumn LineNr
        hi! link VertSplit Normal
    elseif (g:colors_name == 'gruvbox')
        hi! Visual  gui=NONE guibg=#3c3836
    endif
    " syntax sync fromstart
    " highlight clear Search | highlight Search term=underline cterm=underline ctermfg=14 gui=underline guifg=#bf5656

    if (g:enable_transparent_bg == 1)
        highlight Normal ctermbg=NONE guibg=NONE
    endif
endfunction
