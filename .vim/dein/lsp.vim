" Diagnostics
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_float_cursor = 1

" Signs
let g:lsp_diagnostics_signs_delay = 200
let g:lsp_diagnostics_signs_error = { 'text': ' ' }
let g:lsp_diagnostics_signs_warning = { 'text': ' ' }
let g:lsp_diagnostics_signs_hint = { 'text': ' ' }
let g:lsp_diagnostics_signs_information = { 'text': ' ' }

" Highlights
highlight link LspErrorHighlight ALEError
highlight link LspWarningHighlight ALEWarning
highlight link LspHintHighlight ALEWarning
highlight link LspInformationHighlight ALEInfo

" Key mappings
nmap <buffer> <Space>a <Plug>(lsp-code-action)
nmap <buffer> <Space>d :sp<CR>:LspDefinition<CR>
nmap <buffer> <Space>D <Plug>(lsp-hover)
nmap <buffer> <Space>r <Plug>(lsp-rename)
nmap <buffer> <Space>f <Plug>(lsp-document-format)
nmap <buffer> <Space>p <Plug>(lsp-previous-diagnostic)
nmap <buffer> <Space>n <Plug>(lsp-next-diagnostic)
nmap <buffer> <Space>gd <Plug>(lsp-document-diagnostics)
nmap <buffer> <Space>gS <Plug>(lsp-workspace-symbol)
nmap <buffer> <expr><C-f> lsp#scroll(+8)
nmap <buffer> <expr><C-d> lsp#scroll(-8)

if !has('nvim')
  autocmd User lsp_float_opened
    \ call popup_setoptions(lsp#ui#vim#output#getpreviewwinid(),
    \   {'border': [0, 0, 0, 0],
    \    'padding': [1, 1, 1, 1]})
end
