nnoremap <silent> aj :ALENext<CR>
nnoremap <silent> ak :ALEPrevious<CR>
nnoremap <silent> a0 :ALEFirst<CR>
nnoremap <silent> a$ :ALELast<CR>
nnoremap <silent> af :ALEFix<CR>

let g:ale_fixers = {
\   'rust': ['rustfmt']
\ }
