vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  float = { border = vim.g.border_type }
})

local open_floating_fallback = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  -- opts = opts or {}
  opts.border = opts.border or vim.g.border_type
  return open_floating_fallback(contents, syntax, opts, ...)
end

local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }

  local ls_mapping = '<cmd>lua vim.lsp.buf.document_symbol()<cr>'
  if vim.fn.exists("g:loaded_telescope") then
    ls_mapping = '<cmd>Telescope lsp_document_symbols<cr>'
  end
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', ls_mapping, opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cv', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.api.nvim_create_autocmd("CursorHoldI", { callback = vim.lsp.buf.signature_help, buffer = bufnr })
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[I', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>lf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
end

local capabilities = {}
if vim.fn.exists("g:loaded_cmp_lsp") then
  capabilities = require('cmp_nvim_lsp').default_capabilities()
end

local servers = {'clangd', 'tsserver', 'sourcekit', 'pylsp', 'intelephense', 'jdtls', 'emmet_ls'}
if vim.fn.exists("g:loaded_mason_lspconfig") then
  servers = require('mason-lspconfig').get_installed_servers()
end
for _, server in pairs(servers) do
  local config_table = {
    on_attach = on_attach,
    capabilities = capabilities
  }

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
