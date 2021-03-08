" Mapping Alt+E
nnoremap <silent><A-e> :<C-U>Fern . -drawer -toggle<CR>

" Like nerdtree
let g:fern#renderer#default#leading = "  "
let g:fern#renderer#default#root_symbol = ""
let g:fern#renderer#default#leaf_symbol = ""
let g:fern#renderer#default#collapsed_symbol = "▶ "
let g:fern#renderer#default#expanded_symbol = "▼ "
