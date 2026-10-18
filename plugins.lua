function on_package_changed(ev)
  if ev.data.kind == "delete" then
    vim.g["registered_" .. ev.data.spec.name] = nil;
    return;
  end

  if ev.data.active then
    vim.g["plugin_" .. plugin.spec.name .. "_loaded"] = true;
  end
end

vim.api.nvim_create_autocmd('PackChanged', { callback = on_package_changed })

vim.pack.add({
  { src = 'https://github.com/tpope/vim-fugitive',    version = 'v3.7',    name = 'fugitive'        },
  { src = 'https://github.com/tpope/vim-repeat',      version = 'v1.2',    name = 'surround-repeat' },
  { src = 'https://github.com/tpope/vim-surround',    version = 'v2.2',    name = 'surround'        },
  { src = 'https://github.com/neovim/nvim-lspconfig', version = 'v2.12.0', name = 'lspconfigs'      }, -- @Testing to see if i miss it or not
  { src = 'https://github.com/tinted-theming/tinted-vim', version = 'main', name = 'base16' }, -- @Testing to see if i miss it or not
  -- { src = 'https://github.com/nvim-telescope/telescope.nvim', version = 'v0.2.2', name = 'telescope' }, -- @Testing to see if i miss it or not
  -- { src = 'https://github.com/nvim-lua/plenary.nvim', version = 'v0.1.4', name = 'plenary' }, -- Depends on telescope
  -- { src = 'https://github.com/sheerun/vim-polyglot', version = 'v4.17.1', name = 'polyglot'   }, -- @Testing to see if i need it or not
  -- { src = 'https://github.com/vimwiki/vimwiki',   version = 'v2024.01.24', name = 'vimwiki'   }, -- @Testing do i really need a plugin i only use for tables, markdown (already pandoc supported) and jump to files (already in vim)
});

-- Register active plugins for vimscript checks
for _, plugin in ipairs(vim.pack.get()) do
  if (plugin.active) then
    vim.g["plugin_" .. plugin.spec.name .. "_loaded"] = true;
  end
end
