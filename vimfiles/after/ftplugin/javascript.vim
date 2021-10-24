if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

setlocal formatoptions-=o
setlocal include=require('\\zs[^']*\\ze');
setlocal define=function\\\|const\\\|var\\\|let\\s\\+
setlocal suffixesadd=.js
setlocal shiftwidth=2

inoreabbrev <buffer> cl console.log();<C-O>h
inoreabbrev <buffer> req require('');<C-O>2h

let b:undo_ftplugin .= '|set formatoptions<'
let b:undo_ftplugin .= '|set include<'
let b:undo_ftplugin .= '|set define<'
let b:undo_ftplugin .= '|set suffixesadd<'
let b:undo_ftplugin .= '|set shiftwidth<'

let b:undo_ftplugin .= '|iunabbrev <buffer> cl'
let b:undo_ftplugin .= '|iunabbrev <buffer> req'
