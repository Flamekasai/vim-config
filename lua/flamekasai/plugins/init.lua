local lazypath = vim.g.vim_path .. '/lazy/lazy.nvim';
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',

  {
    'neovim/nvim-lspconfig',
    config = function()
      require('flamekasai.plugins.lspconfig')
    end,
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        init = function()
          vim.g.loaded_mason_lspconfig = true
        end,
        config = true,
        dependencies = {
          {
            'williamboman/mason.nvim',
            config = true
          }
        }
      },
    }
  },
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  --'nvim-treesitter/nvim-treesitter', -- TODO: {'do': ':TSUpdate'}
  {
      'sheerun/vim-polyglot',
      init = function()
        vim.cmd.source(vim.g.vim_path .. "/plugin/polyglot.vim")
      end
  },

  {
    'vimwiki/vimwiki',
    init = function()
      vim.cmd.source(vim.g.vim_path .. "/plugin/vimwiki.vim")
    end
  },

  {
      'RRethy/nvim-base16',
      init = function()
          vim.g.loaded_nvim_base16 = true
      end
  },
}, {
  root = vim.g.vim_path .. '/lazy/',
  lockfile = vim.g.vim_path .. '/lazy/lock-package.json',
  ui = {
    -- TODO: Change this icons to whatever you like
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  -- install = {
  --   missing = false,
  -- },
  performance = {
    rtp = {
      reset = false,
    }
  }
});
