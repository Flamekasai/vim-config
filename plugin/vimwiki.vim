let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings["all_maps"] = 1
let g:vimwiki_key_mappings["global"] = 0
let g:vimwiki_key_mappings["headers"] = 1
let g:vimwiki_key_mappings["text_objs"] = 1
let g:vimwiki_key_mappings["table_format"] = 1
let g:vimwiki_key_mappings["table_mappings"] = 1
let g:vimwiki_key_mappings["lists"] = 1
let g:vimwiki_key_mappings["links"] = 1
let g:vimwiki_key_mappings["html"] = 0
let g:vimwiki_key_mappings["mouse"] = 0

let s:notes = {}
let s:notes["path"] = "/data/home/Documents/Notes"
let s:notes["path_html"] = "/data/home/Documents/Notes/html"
let s:notes["syntax"] = "markdown"
let s:notes["ext"] = '.md'
let s:notes["auto_export"] = 0
let g:vimwiki_list = [s:notes]
unlet s:notes

let g:vimwiki_listsyms = ' .oOx'
let g:vimwiki_table_auto_fmt = 1
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_hl_headers = 0
let g:vimwiki_conceallevel = 2
