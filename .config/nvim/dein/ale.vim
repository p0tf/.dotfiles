nnoremap <silent> <Space>n :ALENext<CR>
nnoremap <silent> <Space>p :ALEPrevious<CR>
nnoremap <silent> <Space>0 :ALEFirst<CR>
nnoremap <silent> <Space>; :ALELast<CR>
nnoremap <silent> <Space>f :ALEFix<CR>
nnoremap <silent> <Space>d :ALEDetail<CR>

let g:ale_fixers = {
\   'rust': ['rustfmt']
\ }
