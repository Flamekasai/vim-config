vim.diagnostic.config({
  virtual_text = true,
  -- virtual_lines = true,
  underline = true,
  float = { border = vim.g.border_type }
})

local open_floating_fallback = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  -- opts = opts or {}
  opts.border = opts.border or vim.g.border_type
  return open_floating_fallback(contents, syntax, opts, ...)
end

local open_in_location_list = function (options)
    vim.fn.setloclist(0, {}, ' ', options)
    vim.api.nvim_command('lopen')
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { noremap=true, silent=true }
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client:supports_method('textDocument/documentSymbol') then
      local ls_mapping = '<cmd>lua vim.lsp.buf.document_symbol()<cr>'
      if vim.g.loaded_telescope then
        ls_mapping = '<cmd>Telescope lsp_document_symbols<cr>'
      end
      vim.api.nvim_buf_set_keymap(event.buf, 'n', '<leader>ls', ls_mapping, opts)
    end

    if client:supports_method('textDocument/definition') then
      vim.api.nvim_buf_set_keymap(event.buf, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    end
    if client:supports_method('textDocument/hover') then
      vim.api.nvim_buf_set_keymap(event.buf, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    end
    if client:supports_method('textDocument/rename') then
      vim.api.nvim_buf_set_keymap(event.buf, 'n', 'cv', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    end
    if client:supports_method('textDocument/codeAction') then
      vim.api.nvim_buf_set_keymap(event.buf, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
    if client:supports_method('textDocument/references') then
      vim.api.nvim_buf_set_keymap(event.buf, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    end

    if client:supports_method('textDocument/completion') then
      vim.api.nvim_buf_set_keymap(event.buf, 'i', '<c-o>', '<c-x><c-o>', opts)
      vim.opt.completeopt = 'menuone,fuzzy,noselect'
      vim.lsp.completion.enable(true, event.data.client_id, event.buf, { autotrigger = true })
    end
  end,
})

local servers = {'clangd', 'tsserver', 'sourcekit', 'pylsp', 'intelephense', 'jdtls', 'emmet_ls'}
if vim.g.loaded_mason_lspconfig then
  servers = require('mason-lspconfig').get_installed_servers()
end
for _, server in pairs(servers) do
  local config_table = {}

  if server == 'clangd' then
    config_table.cmd = { 'clangd', '--completion-style=detailed'}
  elseif server == 'sourcekit' then
    config_table.filetypes = {'swift'}
  elseif server == 'emmet_ls' then
    config_table.filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "blade",
      "eruby"
    }
  end
  require('lspconfig')[server].setup(config_table)
end
