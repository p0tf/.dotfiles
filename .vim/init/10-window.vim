" Windows
nnoremap <silent> <Leader>s :<C-u>new<CR>
nnoremap <silent> <Leader>S :<C-u>split<CR>
nnoremap <silent> <Leader>v :<C-u>vnew<CR>
nnoremap <silent> <Leader>V :<C-u>vsplit<CR>
nnoremap <silent> <Leader>q :<C-u>close<CR>
nnoremap <silent> <Leader>q! :<C-u>close!<CR>
nnoremap <silent> <Leader>t <C-w>t
nnoremap <silent> <Leader>b <C-w>b
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader>J <C-w>J
nnoremap <silent> <Leader>K <C-w>K
nnoremap <silent> <Leader>H <C-w>H
nnoremap <silent> <Leader>L <C-w>L
nnoremap <silent> <Leader>= <C-w>=
nnoremap <silent> <Leader>< <C-w><
nnoremap <silent> <Leader>> <C-w>>
nnoremap <silent> <Leader>+ <C-w>+
nnoremap <silent> <Leader>- <C-w>-

" Tabpages
nnoremap <silent> [t :<C-u>tabprevious<CR>
nnoremap <silent> ]t :<C-u>tabnext<CR>
nnoremap <silent> <Leader>^ :<C-u>tabfirst<CR>
nnoremap <silent> <Leader>$ :<C-u>tablast<CR>
nnoremap <silent> <Leader>c :<C-u>tabnew<CR>
nnoremap <silent> <Leader>C :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> <Leader>x :<C-u>tabclose<CR>
nnoremap <silent> <Leader>x! :<C-u>tabclose!<CR>
nnoremap <silent> <Leader>X :<C-u>tabonly<CR>
nnoremap <silent> <Leader>X! :<C-u>tabonly!<CR>
nnoremap <silent> <Leader>m0 :<C-u>tabmove0<CR>
nnoremap <silent> <Leader>m$ :<C-u>tabmove$<CR>
for n in range(1, 9)
    execute 'nnoremap <silent> <Leader>'.n ':<C-u>tabnext'.n.'<CR>'
    execute 'nnoremap <silent> <Leader>m'.n ':<C-u>tabmove'.n.'<CR>'
    execute 'nnoremap <silent> <Leader>m+'.n ':<C-u>tabmove+'.n.'<CR>'
    execute 'nnoremap <silent> <Leader>m-'.n ':<C-u>tabmove-'.n.'<CR>'
endfor
