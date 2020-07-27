if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

inoreabbrev <buffer> css: <ESC>:read $VIM/vimfiles/mySnippets/css.css<CR>kdd

let b:undo_ftplugin .= '|iunabbrev <buffer> css:'
