local border = {
  {"╭", "Pmenu"},
  {"─", "Pmenu"},
  {"╮", "Pmenu"},
  {"│", "Pmenu"},
  {"╯", "Pmenu"},
  {"─", "Pmenu"},
  {"╰", "Pmenu"},
  {"│", "Pmenu"},
}

require('lsp_signature').setup {
  handler_opts = {
    border = border,
  }
}
