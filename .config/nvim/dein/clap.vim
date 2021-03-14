" Key bind
nnoremap <C-p> :Clap<CR>

let g:clap_enable_icon = 1

" Turn off auto completion
autocmd FileType clap_input let b:asyncomplete_enable = 0
