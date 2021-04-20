" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if exists('g:lexima_no_default_rules')
  call lexima#set_default_rules()
  inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : lexima#expand('<LT>CR>', 'i')
else
  inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
endif

" Customize completeopt.
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,preview
