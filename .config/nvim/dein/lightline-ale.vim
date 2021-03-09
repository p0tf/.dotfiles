let g:lightline#ale#indicator_checking = ' Checking...'
let g:lightline#ale#indicator_warnings = ' '
let g:lightline#ale#indicator_errors = ' '
let g:lightline#ale#indicator_ok = ' OK'

let g:lightline.component_expand = {
\   'ale-checking': 'lightline#ale#checking',
\   'ale-errors': 'lightline#ale#errors',
\   'ale-warnings': 'lightline#ale#warnings',
\   'ale-ok': 'lightline#ale#ok'
\ }

let g:lightline.component_type = {
\   'ale-checking': 'right',
\   'ale-errors': 'error',
\   'ale-warnings': 'warning',
\   'ale-ok': 'right'
\ }
