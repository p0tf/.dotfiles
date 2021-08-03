require('lspsaga').init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  infor_sign = '',
  hint_sign = '',
  code_action_icon = ' ',
  code_action_prompt = {
    virtual_text = false,
  },
  border_style = 'round',
}

vim.cmd[[
  augroup lspsaga
    autocmd!
    autocmd CursorMoved * Lspsaga show_cursor_diagnostics
  augroup END
]]

local u = require('utils')
u.csmap('n', 'd', 'Lspsaga diagnostic_jump_prev', 'Lspsaga diagnostic_jump_next')
u.cmap('n', 'a', 'Lspsaga code_action')
u.cmap('n', 'd', 'Lspsaga hover_doc')
u.cmap('n', 'r', 'Lspsaga rename')
u.cmap('n', 'i', 'Lspsaga preview_definition')
u.cmap('n', 'f', 'Lspsaga lsp_finder')
u.csmap('n', 'p', "lua require('lspsaga.action').smart_scroll_with_saga(-1)", "lua require('lspsaga.action').smart_scroll_with_saga(1)")
