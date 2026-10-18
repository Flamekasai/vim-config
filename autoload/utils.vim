function! utils#RemoveTrailingWhitespace() abort
  if !&binary && &filetype != "diff"
    let s:oldSearchRegister=@/
    %substitute/\s\+$//e
    let @/=s:oldSearchRegister
    unlet s:oldSearchRegister
  endif
endfunction

function! utils#FlamekasaiStatusLine() abort
    let l:modeHighlight  = "%#User2#"
    let l:infoHighlight  = "%#User4#"
    let l:resetHighlight = "%##"
    let l:s = modeHighlight . " "
    let l:s .= "%t%{!&modifiable || &modified || &readonly ? ' ' : ''}%m%r "
    let l:s .= l:resetHighlight
    if has("nvim")
        let l:s.= "%="
    endif
    " Change %t to %.35f to have full path limited to 35 chars
    let l:s .= "%="
    if exists("g:loaded_fugitive")
        let l:s .= l:modeHighlight
        let l:s .= "%{FugitiveIsGitDir() ? (' ' . FugitiveHead() . ' ') : ''}"
    endif
    let l:s .= l:infoHighlight . " "
    if !empty(&filetype)
        let l:s .= "%{&filetype} "
    endif
    let l:s .= "%l/%L "
    let l:s .= l:resetHighlight
    return s
endfunction

function! utils#SetRandomColorscheme(random_group) abort
    if (a:random_group ==? "favorites")
        let l:colors = readfile(g:vim_path . "/favorite.colors")
    elseif (a:random_group ==? "light")
        let l:colors = readfile(g:vim_path . "/light.colors")
    else
        let l:colors = readfile(g:vim_path . "/random.colors")
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

" @Cleanup maybe this function is only needed for the transparent background
function! utils#ChangeHighlights() abort
    if (g:transparent_bg == v:true)
        highlight Normal ctermbg=NONE guibg=NONE
    endif
endfunction

function! utils#OnLspChange(attached) abort
    if (a:attached)
        let l:command = "nnoremap <buffer> "
    else
        let l:command = "unmap <buffer> "
    endif

    execute l:command .. "[d" .. " " .. "<cmd>lua vim.diagnostic.jump({count=-1,float=true})<cr>"
    execute l:command .. "]d" .. " " .. "<cmd>lua vim.diagnostic.jump({count=+1,float=true})<cr>"
    execute l:command .. "cv" .. " " .. "<cmd>lua vim.lsp.buf.rename()<cr>"
    execute l:command .. "<leader>ld" .. " " .. "<cmd>lua vim.diagnostic.setqflist()<cr>"
endfunction
