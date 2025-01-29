local cmp = require('cmp')

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
}


local buffers_and_path = {
  {
    name = 'buffer',
    option = {
      get_bufnrs = function()
        return vim.api.nvim_list_bufs()
      end
    }
  },
  {
    name = 'path'
  }
}

local advanced_sources = {
    { name = 'nvim_lsp' }
}

if vim.fn.exists("g:loaded_cmp_luasnip") then
  local ok, luasnip = pcall(require, 'luasnip')
  if ok then
    table.insert(advanced_sources, { name = 'luasnip' })
    mappings['<c-]>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, modes)
  end
end

local options = {
  window = {
    completion = { border = vim.g.border_type },
    documentation = { border = vim.g.border_type },
  },
  mapping = mappings,
  sources = cmp.config.sources(advanced_sources, buffers_and_path),
  completion = {
    -- autocomplete = false,
    keyword_length = 3,
  },
  experimental = { ghost_text = true },
}

if vim.fn.exists("g:loaded_cmp_luasnip") then
  local ok, luasnip = pcall(require, 'luasnip')
  if ok then
    options.snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    }
  end
end

cmp.setup(options)
