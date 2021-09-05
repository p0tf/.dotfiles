let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0


function! s:lsp_start() abort
  nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
  nmap <buffer> <Leader>a <Plug>(lsp-code-action)
  nmap <buffer> <Leader>d <Plug>(lsp-hover)
  nmap <buffer> <Leader>r <Plug>(lsp-rename)
  nmap <buffer> <Leader>i <Plug>(lsp-peek-definition)
  nmap <buffer> <Leader>f <Plug>(lsp-workspace-symbol-search)
  autocmd BufWritePre <buffer> LspDocumentFormatSync
endfunction

augroup lsp_start
  autocmd!
  autocmd User lsp_buffer_enabled call s:lsp_start()
augroup END
