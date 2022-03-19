let g:user_emmet_install_global = 0
augroup EmmetConfig
    autocmd! EmmetConfig
    autocmd FileType html,xml,aspx EmmetInstall
augroup END
let g:user_emmet_leader_key=','

let g:user_emmet_expandabbr_key='<Tab>'
let g:user_emmet_next_key='<C-]>'
