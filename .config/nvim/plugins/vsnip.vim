let g:vsnip_snippet_dir = $HOME . '/.config/nvim/snippets'
let g:snips_author = trim(system('git config user.name'))

imap <expr> <Tab> pumvisible() ? '<C-n>' :
                \ (vsnip#expandable() <Bar><Bar> vsnip#jumpable(1)) ? '<Plug>(vsnip-expand-or-jump)' :
                \ '<Tab>'
imap <expr> <S-Tab> pumvisible() ? '<C-n>' :
                \ vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)':
                \ '<S-Tab>'
