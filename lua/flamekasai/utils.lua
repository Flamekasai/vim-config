local M = {}
M.is_plugin_loaded = function(plugin)
  local  plugins = require('lazy.core.config').plugins
  return plugins[plugin] and plugins[plugin]._.installed
end

local mode_names = {
  ['n']    = 'normal',
  ['no']   = 'normal',
  ['nov']  = 'normal',
  ['noV']  = 'normal',
  ['no'] = 'normal',
  ['niI']  = 'normal',
  ['niR']  = 'normal',
  ['niV']  = 'normal',
  ['v']    = 'visual',
  ['V']    = 'v-line',
  ['']   = 'v-block',
  ['s']    = 'select',
  ['S']    = 's-line',
  ['']   = 's-block',
  ['i']    = 'insert',
  ['ic']   = 'insert',
  ['ix']   = 'insert',
  ['R']    = 'replace',
  ['Rc']   = 'replace',
  ['Rv']   = 'v-replace',
  ['Rx']   = 'replace',
  ['c']    = 'command',
  ['cv']   = 'ex-mode',
  ['ce']   = 'ex-mode',
  ['r']    = 'hit-enter',
  ['rm']   = 'more',
  ['r?']   = 'confirm',
  ['!']    = 'shell',
  ['t']    = 'terminal',
  ['nt']   = 'terminal'
}

M.colorize_statusline = function()
  local global_highlights = 0
  local mode_style = vim.api.nvim_get_hl(global_highlights, {name = 'Keyword', link = false})
  local info_style = vim.api.nvim_get_hl(global_highlights, {name = 'String', link = false})
  mode_style.reverse = true
  info_style.reverse = true
  vim.api.nvim_set_hl(global_highlights, 'StatusLineMode', mode_style)
  vim.api.nvim_set_hl(global_highlights, 'StatusLineInfo', info_style)
end

vim.g.FlamekasaiStatusLine = function()
  local lineString = {}

  table.insert(lineString, '%#StatusLineMode# ')
  table.insert(lineString, vim.fn.toupper(mode_names[vim.fn.mode('fullmode')]) .. ' ')
  table.insert(lineString, '%#StatusLine# %<%=')
  table.insert(lineString, '%f %(%q%w%h%r%m%) %=')
  table.insert(lineString, '%S ')
  if M.is_plugin_loaded('vim-fugitive') then
      -- let contents .= '%#StatusLineBranch#'
      table.insert(lineString, '%#StatusLineMode#')
      table.insert(lineString, [[%{FugitiveIsGitDir() ? (' ' . FugitiveHead() . ' ') : ''}]])
  end
  table.insert(lineString, '%#StatusLineInfo# ')
  if (vim.bo.filetype ~= '') then
    table.insert(lineString, '%{&ft} ')
  end
  table.insert(lineString, '%l:%L ')
  return table.concat(lineString)
end

M.random_colorscheme = function(only_favorites)
  local only_favorites = only_favorites or false
  local colors = vim.fn.readfile(vim.g.vim_path .. '/favoriteColors.colors')
  if (not only_favorites) then
    vim.list_extend(colors, vim.fn.readfile(vim.g.vim_path .. '/randomColors.colors'))
  end
  local index = math.random(#colors)
  local colorscheme = colors[index]
  vim.cmd.colorscheme(colorscheme)
  vim.print('current colorscheme: ' .. colorscheme)
end

return M
