" Windows
nnoremap <silent> <Space>s :<C-u>new<CR>
nnoremap <silent> <Space>S :<C-u>split<CR>
nnoremap <silent> <Space>v :<C-u>vnew<CR>
nnoremap <silent> <Space>V :<C-u>vsplit<CR>
nnoremap <silent> <Space>q :<C-u>close<CR>
nnoremap <silent> <Space>q! :<C-u>close!<CR>
nnoremap <silent> <Space>t <C-w>t
nnoremap <silent> <Space>b <C-w>b
nnoremap <silent> <Space>j <C-w>j
nnoremap <silent> <Space>k <C-w>k
nnoremap <silent> <Space>h <C-w>h
nnoremap <silent> <Space>l <C-w>l
nnoremap <silent> <Space>J <C-w>J
nnoremap <silent> <Space>K <C-w>K
nnoremap <silent> <Space>H <C-w>H
nnoremap <silent> <Space>L <C-w>L
nnoremap <silent> <Space>= <C-w>=
nnoremap <silent> <Space>< <C-w><
nnoremap <silent> <Space>> <C-w>>
nnoremap <silent> <Space>+ <C-w>+
nnoremap <silent> <Space>- <C-w>-

" Tabpages
nnoremap <silent> <Space><Left> :<C-u>tabprevious<CR>
nnoremap <silent> <Space><Right> :<C-u>tabnext<CR>
nnoremap <silent> <Space>^ :<C-u>tabfirst<CR>
nnoremap <silent> <Space>$ :<C-u>tablast<CR>
nnoremap <silent> <Space>c :<C-u>tabnew<CR>
nnoremap <silent> <Space>C :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> <Space>x :<C-u>tabclose<CR>
nnoremap <silent> <Space>x! :<C-u>tabclose!<CR>
nnoremap <silent> <Space>X :<C-u>tabonly<CR>
nnoremap <silent> <Space>X! :<C-u>tabonly!<CR>
nnoremap <silent> <Space>m0 :<C-u>tabmove0<CR>
nnoremap <silent> <Space>m$ :<C-u>tabmove$<CR>
for n in range(1, 9)
    execute 'nnoremap <silent> <Space>'.n ':<C-u>tabnext'.n.'<CR>'
    execute 'nnoremap <silent> <Space>m'.n ':<C-u>tabmove'.n.'<CR>'
    execute 'nnoremap <silent> <Space>m+'.n ':<C-u>tabmove+'.n.'<CR>'
    execute 'nnoremap <silent> <Space>m-'.n ':<C-u>tabmove-'.n.'<CR>'
endfor
