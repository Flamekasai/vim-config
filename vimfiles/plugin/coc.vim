let g:coc_config_home = substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/coc'
let g:coc_data_home = substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/coc'
let g:coc_snippet_next ="<C-]>"

function HasActiveLSP() abort
    let cocServices = CocAction("services")
    for service in cocServices
        for id in service.languageIds
            if (&filetype == id)
                return v:true
            endif
        endfor
    endfor

    return v:false
endfunction
