let g:coc_config_home = substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/coc'
let g:coc_data_home = substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/coc'
let g:coc_snippet_next ="<C-]>"

function HasActiveLSP() abort
    let currentFileExtension = expand('%:e')
    let cocServices = CocAction("services")
    for service in cocServices
        for id in service.languageIds
            if (currentFileExtension == id)
                return v:true
            endif
        endfor
    endfor

    return v:false
    " return exists("b:coc_diagnostic_info")
    " return !empty(coc#util#root_patterns().server)
endfunction
