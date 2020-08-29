nnoremap <silent> ,n :ALENext<CR>
nnoremap <silent> ,p :ALEPrevious<CR>
nnoremap <silent> ,0 :ALEFirst<CR>
nnoremap <silent> ,; :ALELast<CR>
nnoremap <silent> ,f :ALEFix<CR>
nnoremap <silent> ,d :ALEDetail<CR>

let g:ale_fixers = {
\   'rust': ['rustfmt']
\ }
