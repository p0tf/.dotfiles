require('gitsigns').setup {
  signs = {
    add = {hl = 'GitGutterAdd', text = ''},
    change = {hl = 'GitGutterChange', text = ''},
    delete = {hl = 'GitGutterDelete', text = ''},
    topdelete = {hl = 'GitGutterDelete', text = ''},
    changedelete = {hl = 'GitGutterChange', text = ''},
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ['n [g'] = {
      expr = true,
      "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"
    },
    ['n ]g'] = {
      expr = true,
      "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"
    },

    ['n <leader>ga'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>gd'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>gg'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
  }
}
