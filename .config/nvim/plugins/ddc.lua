vim.fn['ddc#custom#patch_global']('sources', {
  -- 'around',
  'ddc-vim-lsp',
  'vsnip',
})

vim.fn['ddc#custom#patch_global']('sourceOptions', {
  ['_'] = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_rank'},
  },
  ['ddc-vim-lsp'] = {
    mark = 'LSP',
    forceCompletionPattern = '\\.|:|->',
  },
})

vim.fn['ddc#enable']()
