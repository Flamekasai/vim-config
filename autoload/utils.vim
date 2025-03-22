function! utils#RemoveTrailingWhitespace() abort
  if !&binary && &filetype != "diff"
    let s:oldSearchRegister=@/
    %substitute/\s\+$//e
    let @/=s:oldSearchRegister
    unlet s:oldSearchRegister
  endif
endfunction

function! utils#MyTabLine() abort
    let l:s = ""
    for i in range(tabpagenr("$"))
        let l:s .= "%#TabLineFill# "
        if i + 1 == tabpagenr()
            let l:s .= "%#TabLineSel# "
        else
            let l:s .= "%#TabLine# "
        endif
        let l:s .= i + 1
        " Comment This to only have numbers "
        "==================================="
        " let buffersInTab = tabpagebuflist(i + 1)
        " let firstBufferInTab = bufname(buffersInTab[0])
        " let s .= (getbufvar(buffersInTab[tabpagewinnr(i + 1) - 1], "&mod")?" [+] ":" ")
        " if empty(firstBufferInTab)
        "     let firstBufferInTab="[Sin Nombre]"
        " else
        "     let firstBufferInTab = fnamemodify(firstBufferInTab, ":t")
        " endif
        " let s .= firstBufferInTab . " "
        "==================================="
    endfor
    let l:s .= "%#TabLineFill#%T"
    return s
endfunction

function! utils#FlamekasaiStatusLine() abort
    let l:s = "%#StatusLineMode# "
    let l:s .= "%t%{!&modifiable || &modified || &readonly ? ' ' : ''}%m%r "
    let l:s .= "%##"
    if has("nvim")
        let l:s.= "%="
    endif
    " Change %t to %.35f to have full path limited to 35 chars
    let l:s .= "%="
    if exists("g:loaded_fugitive")
        let l:s .= "%#StatusLineMode#"
        let l:s .= "%{FugitiveIsGitDir() ? (' ' . FugitiveHead() . ' ') : ''}"
    endif
    let l:s .= "%#StatusLineInfo# "
    if !empty(&filetype)
        let l:s .= "%{&filetype} "
    endif
    let l:s .= "%l/%L "
    let l:s .= "%#StatusLine#"
    return s
endfunction

function! utils#SetRandomColorscheme(random_group) abort
    let l:colors = readfile(g:vim_path . "/favorite.colors")
    if (a:random_group ==? "light")
        let l:colors = readfile(g:vim_path . "/light.colors")
    elseif (a:random_group !=? "favorites")
        call extend(colors, readfile(g:vim_path . "/random.colors"))
    endif

    let l:randomOffset = rand()
    let l:limit = len(colors)
    let l:randomOffset = randomOffset % limit
    execute "colorscheme " . colors[randomOffset]

    call utils#ChangeHighlights()

    redraw
    echomsg "colorscheme: " . g:colors_name
    unlet colors
endfunction

function! utils#RandomColorsCompletion(ArgLead, CmdLine, CursorPos) abort
    return "random\nfavorites\nlight"
endfunction

function! utils#ChangeHighlights() abort
    hi! link SignColumn LineNr
    hi! link FloatBorder Normal
    hi! link Pmenu Normal
    hi! link DiagnosticSignError DiagnosticError
    hi! link DiagnosticSignWarn DiagnosticWarn
    hi! link DiagnosticSignHint DiagnosticHint
    hi! link DiagnosticSignInfo DiagnosticInfo

    if (g:colors_name == "base16-papercolor-dark")
        hi! link LineNr WarningMsg
        hi! link CursorLineNr SpecialKey
        hi! link StatusLine TermCursor
        hi! link StatusLineNC TermCursorNC
        hi! link TabLine TermCursorNC
        hi! link TabLineFill TermCursorNC
        hi! link TabLineSel TermCursor
        hi! link SignColumn LineNr
        hi! link VertSplit Normal
    elseif (g:colors_name == "gruvbox")
        hi! Visual  gui=NONE guibg=#3c3836
    endif

    " syntax sync fromstart

    if (g:transparent_bg == v:true)
        highlight Normal ctermbg=NONE guibg=NONE
    endif
endfunction
