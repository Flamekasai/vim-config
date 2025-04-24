local M = {}
M.is_plugin_loaded = function(plugin)
  local  plugins = require('lazy.core.config').plugins
  return plugins[plugin] and plugins[plugin]._.installed
end

M.colorize_statusline = function()
  local global_highlights = 0
  local mode_style = vim.api.nvim_get_hl(global_highlights, {name = 'Keyword', link = false})
  local info_style = vim.api.nvim_get_hl(global_highlights, {name = 'String', link = false})
  mode_style.reverse = true
  info_style.reverse = true
  vim.api.nvim_set_hl(global_highlights, 'StatusLineMode', mode_style)
  vim.api.nvim_set_hl(global_highlights, 'StatusLineInfo', info_style)
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
