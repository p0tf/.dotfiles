nnoremap <silent> <Space>n :ALENext<CR>
nnoremap <silent> <Space>p :ALEPrevious<CR>
nnoremap <silent> <Space>0 :ALEFirst<CR>
nnoremap <silent> <Space>; :ALELast<CR>
nnoremap <silent> <Space>f :ALEFix<CR>
nnoremap <silent> <Space>d :ALEDetail<CR>

let g:ale_fixers = {
\   'rust': ['rustfmt']
\ }

let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '-- '
