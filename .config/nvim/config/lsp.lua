vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})



local border = {
  { "╭", "Pmenu" },
  { "─", "Pmenu" },
  { "╮", "Pmenu" },
  { "│", "Pmenu" },
  { "╯", "Pmenu" },
  { "─", "Pmenu" },
  { "╰", "Pmenu" },
  { "│", "Pmenu" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
  focusable = false
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
  focusable = false,
})

vim.cmd [[
function! s:open_popup(timer) abort
lua << EOF
  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "cursor",
    header = "",
    prefix = function(_, _, _)
      return "● "
    end,
  })
EOF
endfunction

function! s:cursor_moved() abort
  call timer_start(0, funcref('s:open_popup'))
endfunction

augroup lsp_float_diagnostics
  autocmd! * <buffer>
  autocmd CursorHold <buffer> lua vim.lsp.buf.hover()
  autocmd CursorMoved <buffer> call s:cursor_moved()
augroup END
]]

vim.fn.sign_define("DiagnosticSignError", { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define("DiagnosticSignWarn", { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define("DiagnosticSignInfo", { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define("DiagnosticSignHint", { text = '󰌵', texthl = 'DiagnosticSignHint' })
