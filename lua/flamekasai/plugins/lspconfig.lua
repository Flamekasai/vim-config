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

-- NOTE: Use preview window for hover
-- TODO: Do the same to signatureHelp if you think you need it as hover also shows signature
-- vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
--   local util = require('vim.lsp.util')
--   config = config or {}
--   config.focus_id = ctx.method
--   if vim.api.nvim_get_current_buf() ~= ctx.bufnr then
--     -- Ignore result since buffer changed. This happens for slow language servers.
--     return
--   end
--   if not (result and result.contents) then
--     if config.silent ~= true then
--       vim.notify('No information available')
--     end
--     return
--   end
--   local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
--   markdown_lines = util.trim_empty_lines(markdown_lines)
--   if vim.tbl_isempty(markdown_lines) then
--     if config.silent ~= true then
--       vim.notify('No information available')
--     end
--     return
--   end
--   local bufid, winid = util.open_floating_preview(markdown_lines, 'markdown', config)
--
--   vim.cmd('pedit +b\\ ' .. bufid .. ' %')
--   vim.api.nvim_win_close(winid, true)
--
--   return bufid, winid
-- end

local utils = require('flamekasai.utils')

local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }

  local telescope_msg = '<cmd>echo \'Telescope is not installed\'<cr>'
  local ld_mapping = telescope_msg
  local ls_mapping = telescope_msg
  if utils.is_plugin_loaded('telescope.nvim') then
    ld_mapping = '<cmd>Telescope diagnostics<cr>'
    ls_mapping = '<cmd>Telescope lsp_document_symbols<cr>'
  end
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lD', ld_mapping, opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', ls_mapping, opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cv', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[I', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>lf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
end

local capabilities = {}
if utils.is_plugin_loaded('cmp-nvim-lsp') then
  capabilities = require('cmp_nvim_lsp').default_capabilities()
end

local function setup_server(server)
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

local servers = {'clangd', 'tsserver', 'sourcekit', 'pylsp', 'intelephense', 'jdtls', 'emmet_ls'}
if utils.is_plugin_loaded('mason-lspconfig.nvim') then
  servers = require('mason-lspconfig').get_installed_servers()
end
for _, server in pairs(servers) do
  setup_server(server)
end
