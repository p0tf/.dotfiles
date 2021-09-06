let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0


function! s:lsp_start() abort
  call leadermap#bpsmap('d', 'lsp-previous-diagnostic', 'lsp-next-diagnostic')
  call leadermap#bpmap('a', 'lsp-code-action')
  call leadermap#bpmap('d', 'lsp-hover')
  call leadermap#bpmap('r', 'lsp-rename')
  call leadermap#bpmap('i', 'lsp-peek-definition')
  call leadermap#bpmap('I', 'lsp-definition')
  call leadermap#bpmap('fl', 'lsp-workspace-symbol-search')
  autocmd BufWritePre <buffer> LspDocumentFormatSync
endfunction

augroup lsp_start
  autocmd!
  autocmd User lsp_buffer_enabled call s:lsp_start()
augroup END
