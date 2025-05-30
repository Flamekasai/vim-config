vim.diagnostic.config({
  -- virtual_text = true,
  virtual_lines = {
      current_line = true
  },
  underline = true,
  jump = {
    float = true
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '┃',
      [vim.diagnostic.severity.WARN]  = '┃',
      [vim.diagnostic.severity.INFO]  = '┃',
      [vim.diagnostic.severity.HINT]  = '┃',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
      [vim.diagnostic.severity.WARN]  = 'DiagnosticWarn',
      [vim.diagnostic.severity.INFO]  = 'DiagnosticInfo',
      [vim.diagnostic.severity.HINT]  = 'DiagnosticHint',
    },
  },
})

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
      -- NOTE: To autocomplete with common written characters
      -- local chars = {}
      -- for i = 32, 126 do
      --   table.insert(chars, string.char(i))
      -- client.server_capabilities.completionProvider.triggerCharacters = chars
      -- end
      vim.api.nvim_buf_set_keymap(event.buf, 'i', '<c-o>', '<c-x><c-o>', opts)
      vim.bo[event.buf].completeopt = 'menuone,fuzzy,noselect'
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
