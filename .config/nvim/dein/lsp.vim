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
if hlexists('ALEError')
  highlight link LspErrorHighlight ALEError
else
  highlight link LspErrorHighlight SpellBad
endif

if hlexists('ALEWarning')
  highlight link LspWarningHighlight ALEWarning
  highlight link LspHintHighlight ALEWarning
else
  highlight link LspWarningHighlight SpellCap
  highlight link LspHintHighlight SpellCap
endif

if hlexists('ALEInfo')
  highlight link LspInformationHighlight ALEInfo
else
  highlight link LspInformationHighlight SpellCap
endif

" Key mappings
nmap <buffer> <Space>a <Plug>(lsp-code-action)
nmap <buffer> <Space>d :sp<CR>:LspDefinition<CR>
nmap <buffer> <Space>D <Plug>(lsp-hover)
nmap <buffer> <Space>r <Plug>(lsp-rename)
nmap <buffer> <Space>f <Plug>(lsp-document-format)
nmap <buffer> <Space>p <Plug>(lsp-previous-diagnostics)
nmap <buffer> <Space>n <Plug>(lsp-next-diagnostics)
nmap <buffer> <Space>gd <Plug>(lsp-document-diagnostics)
nmap <buffer> <Space>gs <Plug>(lsp-document-symbol)
nmap <buffer> <Space>gS <Plug>(lsp-workspace-symbol)
