local cmp = require('cmp')

local feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "", true)
end

cmp.setup {
  preselect = cmp.PreselectMode.Item,
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)')
      else
        fallback()
      end
    end, {'i', 'c'}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)')
      else
        fallback()
      end
    end, {'i', 'c'}),
    ['<Esc>'] = cmp.mapping(cmp.mapping.abort(), {'i', 'c'}),
    ['<CR>'] = cmp.mapping(
      cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
      {'i', 'c'}
    ),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = function (entry, item)
      item.menu = ({
        path = '[file]',
        buffer = '[buf]',
        nvim_lsp = '[lsp]',
        cmdline = '[vim]',
      })[entry.source.name]
      return item
    end
  },
}

cmp.setup.cmdline('/', {
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline('?', {
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  experimental = { ghost_text = true },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  })
})
