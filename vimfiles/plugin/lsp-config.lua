local borderType = "rounded"

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  float = { border = borderType }
})

local open_floating_fallback = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or borderType
  return open_floating_fallback(contents, syntax, opts, ...)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float({scope = "line"})<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float({scope = "cursor"})<CR>', opts)
  vim.api.nvim_set_keymap('n', '[D', '<cmd>lua vim.diagnostic.open_float({scope = "line"})<CR>', opts)
  vim.api.nvim_set_keymap('n', ']D', '<cmd>lua vim.diagnostic.open_float({scope = "buffer"})<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>Telescope diagnostics<CR>', opts)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cv', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[I', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

-- Setup completion lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities();

local servers = {'clangd', 'tsserver', 'sourcekit', 'pylsp', 'intelephense', 'jdtls', 'emmet_ls'}
for _, lsp in pairs(servers) do
  local config_table = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  if lsp == 'clangd' then
    config_table.cmd = { 'clangd', '--completion-style=detailed' }
  elseif lsp == 'sourcekit' then
    config_table.filetypes = {'swift'}
  elseif lsp == 'emmet_ls' then
    config_table.filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "blade",
      "css",
      "sass",
      "scss",
      "less",
      "eruby"
    }
  end

  require('lspconfig')[lsp].setup(config_table)
end
