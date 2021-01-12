let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window=''
if executable('rg')
    let g:rg_derive_root='true'
endif
