if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
endif

setlocal formatoptions-=o

inoreabbrev <buffer> jol System.out.println();<C-O>h
inoreabbrev <buffer> jo System.out.print();<C-O>h
inoreabbrev <buffer> jof System.out.printf();<C-O>h
inoreabbrev <buffer> jfor for (int i = 0; i < count; i++)<CR>{<CR><CR>}<Esc>?count<CR>gn<C-G>
inoreabbrev <buffer> jc class className<CR>{<CR><CR>}<Esc>?className<CR>gn<C-G>
inoreabbrev <buffer> jmain public static void main(String[] args)<CR>{<CR><CR>}<C-O>k

let b:undo_ftplugin .= '|set formatoptions<'
let b:undo_ftplugin .= '|iunabbrev <buffer> jol'
let b:undo_ftplugin .= '|iunabbrev <buffer> jo'
let b:undo_ftplugin .= '|iunabbrev <buffer> jof'
let b:undo_ftplugin .= '|iunabbrev <buffer> jfor'
let b:undo_ftplugin .= '|iunabbrev <buffer> jc'
let b:undo_ftplugin .= '|iunabbrev <buffer> jmain'
