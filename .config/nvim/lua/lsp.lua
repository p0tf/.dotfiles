-- Disable Virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = false,
   update_in_insert = true,
 }
)

vim.cmd[[
  augroup lsp_format
    autocmd!
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
  augroup END
]]
