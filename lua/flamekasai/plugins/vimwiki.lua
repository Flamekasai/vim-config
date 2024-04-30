vim.g.vimwiki_key_mappings = {
  all_maps = 1,
  global = 0,
  headers = 1,
  text_objs = 1,
  table_format = 1,
  table_mappings = 1,
  lists = 1,
  links = 1,
  html = 0,
  mouse = 0,
}

vim.g.vimwiki_list = {
  {
    -- path = vim.g.vim_path .. '/vimwiki/',
    path = vim.g.vim_path .. '/vimwiki/',
    path_html = vim.g.vim_path .. '/vimwiki/html/',
    syntax = 'markdown',
    ext = '.md',
    auto_export = 0,
  },
}

vim.g.vimwiki_listsyms=' .oOx'
vim.g.vimwiki_table_auto_fmt = 1
vim.g.vimwiki_hl_cb_checked = 2
vim.g.vimwiki_hl_headers = 0
vim.g.vimwiki_conceallevel = 0
