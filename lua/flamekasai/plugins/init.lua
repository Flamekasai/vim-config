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
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('flamekasai.plugins.cmp')
    end,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      {
        'hrsh7th/cmp-nvim-lsp',
        init = function()
          vim.g.loaded_cmp_lsp = true
        end
      },
      {
        'saadparwaiz1/cmp_luasnip',
        init = function()
          vim.g.loaded_cmp_luasnip = true
        end,
        dependencies = {
          {
              "L3MON4D3/LuaSnip",
              build = "make install_jsregexp"
          }
        }
      }
    }
  },

  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  --'nvim-treesitter/nvim-treesitter', -- TODO: {'do': ':TSUpdate'}
  'sheerun/vim-polyglot',

  {
    'vimwiki/vimwiki',
    init = function()
      require('flamekasai.plugins.vimwiki')
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
