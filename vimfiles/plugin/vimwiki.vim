let g:vimwiki_key_mappings= {'global': 0} " Disable global mappings for vimwiki, use Ex-Commands
let g:vimwiki_list = [{'path': substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/vimwiki/folder1/',
            \ 'path_html': substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/vimwiki/folder1/html/',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'auto_export': 0},
            \ {'path': substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/vimwiki/college/',
            \ 'path_html': substitute(expand('$HOME'), '\', '/', 'g') . '/vim-config/vimfiles/vimwiki/college/html/',
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'auto_export': 0, 'nested_syntaxes': {'c++': 'cpp'}}]
let g:vimwiki_listsyms=' .oOx'
