local cmp = require('cmp')
local luasnip = require('luasnip')

local modes = {'i'}

local mappings = {
  ['<c-b>'] = cmp.mapping.scroll_docs(-4),
  ['<c-f>'] = cmp.mapping.scroll_docs(4),
  ['<c-e>'] = cmp.mapping.abort(),
  ['<c-p>'] = cmp.mapping.select_prev_item(),
  ['<c-n>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      cmp.complete()
    end
  end, modes),
  ['<c-l>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.confirm({ select = true })
    else
      fallback()
    end
  end, modes),
  ['<c-]>'] = cmp.mapping(function(fallback)
    if luasnip.expand_or_locally_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end, modes),
}

local all_buffers_source = {
  name = 'buffer',
  option = {
    get_bufnrs = function()
      return vim.api.nvim_list_bufs()
    end
  }
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = { border = vim.g.border_type },
    documentation = { border = vim.g.border_type },
  },
  mapping = mappings,
  sources = cmp.config.sources(
  {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  {
    all_buffers_source,
    { name = 'path' }
  }
  ),
  completion = {
    autocomplete = false,
    keyword_length = 3,
  },
  experimental = { ghost_text = true },
})

cmp.setup.filetype({ 'vimwiki', 'markdown'}, {
  sources = {
    all_buffers_source,
    { name = 'path' },
  }
})
