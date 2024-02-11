require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '' },
    change = { hl = 'GitGutterChange', text = '󰏫' },
    delete = { hl = 'GitGutterDelete', text = '' },
    topdelete = { hl = 'GitGutterDelete', text = '' },
    changedelete = { hl = 'GitGutterChange', text = '󰷨' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    vim.keymap.set('n', '[g', function()
      if vim.wo.diff then return '[g' and
            vim.schedule(function() gs.prev_hunk() end)
      end
    end, { expr = true })
    vim.keymap.set('n', ']g', function()
      if vim.wo.diff then return ']g' and
            vim.schedule(function() gs.next_hunk() end)
      end
    end, { expr = true })
    vim.keymap.set('n', '<leader>ga', gs.stage_hunk)
    vim.keymap.set('n', '<leader>gd', gs.undo_stage_hunk)
    vim.keymap.set('n', '<leader>gr', gs.reset_hunk)
    vim.keymap.set('n', '<leader>gR', gs.reset_buffer)
    vim.keymap.set('n', '<leader>gg', gs.preview_hunk)
    vim.keymap.set('n', '<leader>gb', function() gs.blame_line { full = true } end)
  end,
}
