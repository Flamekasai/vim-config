" let g:vimwiki_key_mappings= {'all_maps': 0} " Disable global mappings for vimwiki, use Ex-Commands
let g:vimwiki_list = [
            \ {
            \   'path': substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/vimwiki/',
            \   'path_html': substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/vimwiki/html/',
            \   'syntax': 'markdown', 'ext': '.md',
            \   'auto_export': 0
            \ },
            \]
let g:vimwiki_listsyms=' .oOx'
let g:vimwiki_table_auto_fmt=0
let g:vimwiki_hl_cb_checked=2
let g:vimwiki_hl_headers=0
