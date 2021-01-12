let g:user_emmet_install_global = 0
augroup EmmetConfig
    autocmd! EmmetConfig
    autocmd FileType html,css,xml EmmetInstall
augroup END
let g:user_emmet_leader_key='<C-E>'
