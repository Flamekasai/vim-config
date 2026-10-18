local port = os.getenv('GDScript_Port') or 6005
local pipe = '/tmp/godot.pipe'

vim.lsp.start({
  name = 'Godot',
  cmd = vim.lsp.rpc.connect('127.0.0.1', port),
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    print("GDScript LSP started at " .. pipe ..);
  end
})
