local cmp = require('cmp')
local luasnip = require('luasnip');

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {

      completion = { border = "rounded" },
      documentation = { border = "rounded" },
    },
    mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            cmp.complete()
        end
      end, { 'i', 'c' }),
      ['<C-l>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        -- else
          -- if luasnip.expand_or_locally_jumpable() then
            -- luasnip.expand_or_jump()
          -- else
            -- fallback()
          -- end
        end
      end, { 'i', 'c' }),
      ['<C-]>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
          else
              fallback()
          end
      end, { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping.complete() -- Show completion with ctr-space
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      -- TODO { name = 'cmp_tabnine' },
    }, {
      { name = 'buffer' },
    }),
  completion = { keyword_length = 3 },
  experimental = { ghost_text = true },
})

  cmp.setup.filetype({ 'vimwiki', 'markdown'}, {
      sources = {
        { name = 'path' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          }
        },
      }
    })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
          { name = 'path' },
        }, {
          -- { name = 'cmdline' },
        })
    })
