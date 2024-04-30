local utils   = require('flamekasai.utils')
local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_augroup('FlamekasaiAutocmds', {})

autocmd({'VimEnter'}, {
  group = 'FlamekasaiAutocmds',
  callback = function()
    if (vim.g.random_colors ~= 'none') then
      local only_favorites = vim.g.random_colors == 'favorites'
      vim.cmd.command('-nargs=1 RandomColorscheme lua require("flamekasai.utils").random_colorscheme(<args>)<cr>')
      utils.random_colorscheme(only_favorites)
    end
  end
})

autocmd({'VimEnter', 'Colorscheme'}, {
  group = 'FlamekasaiAutocmds',
  pattern = '*',
  callback = function()
    if (vim.g.transparent_bg) then
      -- TODO: Fix transparent colors cause a lot of colors are not transparent
      -- (not focused windows etc...)
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    end
    utils.colorize_statusline()
  end
})

autocmd('Colorscheme', {
  group = 'FlamekasaiAutocmds',
  pattern = '*',
  callback = function(args)
    -- TODO: Move this to a function maybe? And mix with transparent effects.
    vim.api.nvim_set_hl(0, 'SignColumn', { link = 'LineNr' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

    vim.api.nvim_set_hl(0, 'DiagnosticSignError', { link = 'DiagnosticError' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { link = 'DiagnosticWarn' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { link = 'DiagnosticInfo' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { link = 'DiagnosticHint' })
    vim.api.nvim_set_hl(0, 'DiagnosticSignOk', { link = 'DiagnosticOk' })
  end
})

autocmd('BufWritePre', {
  group = 'FlamekasaiAutocmds',
  pattern = '*',
  callback = utils.remove_trailing_whitespace
})
