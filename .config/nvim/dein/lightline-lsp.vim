let g:lightline#lsp#ok_symbol = ' OK'

let g:lightline.component_expand = {
\   'lsp-ok': 'lightline#lsp#ok',
\   'lsp-error': 'lightline#lsp#error',
\   'lsp-warn': 'lightline#lsp#warning',
\   'lsp-info': 'lightline#lsp#information',
\   'lsp-hint': 'lightline#lsp#hint'
\ }

let g:lightline.component_type = {
\     'lsp-ok': 'right',
\     'lsp-error': 'error',
\     'lsp-warn': 'warning',
\     'lsp-info': 'right',
\     'lsp-hint': 'warning'
\   }
