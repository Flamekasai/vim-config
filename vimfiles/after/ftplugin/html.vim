if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

inoreabbrev <buffer> html5: <ESC>:read $VIM/vimfiles/mySnippets/html.html<CR>kdd

let b:undo_ftplugin .= '|iunabbrev <buffer> html5:'
