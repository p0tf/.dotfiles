let mapleader=' '

" Exit
inoremap jk <Esc>

" Remove Search Highlight
nnoremap <silent> <Esc> :<C-u>nohlsearch<CR>


" Clipboard
nnoremap sp "+p
nnoremap sy "+y
nnoremap sd "+d
xnoremap sy "+y
xnoremap sd "+d

" Windows
nnoremap <expr> <silent> <Leader>c len(filter(range(1, bufnr('$')), { _, val -> bufloaded(val) })) is# 1 ? ':<C-u>quit<CR>' : ':<C-u>bdelete<CR>'
nnoremap <expr> <silent> <Leader>C len(filter(range(1, bufnr('$')), { _, val -> bufloaded(val) })) is# 1 ? ':<C-u>quit!<CR>' : ':<C-u>bdelete!<CR>'
nnoremap <expr> <silent> <Leader>x len(filter(range(1, bufnr('$')), { _, val -> bufloaded(val) })) is# 1 ? ':<C-u>wq<CR>' : ':<C-u>write <Bar> :bdelete<CR>'
call leadermap#cmap('s', 'new')
call leadermap#cmap('S', 'split')
call leadermap#cmap('v', 'vnew')
call leadermap#cmap('V', 'vsplit')
call leadermap#map('h', '<C-w>h')
call leadermap#map('j', '<C-w>j')
call leadermap#map('k', '<C-w>k')
call leadermap#map('l', '<C-w>l')
call leadermap#map('H', '<C-w>H')
call leadermap#map('J', '<C-w>J')
call leadermap#map('K', '<C-w>K')
call leadermap#map('L', '<C-w>L')
call leadermap#map('=', '<C-w>=')
call leadermap#map('<C-h>', '<C-w><')
call leadermap#map('<C-l>', '<C-w>>')
call leadermap#map('<C-l>', '<C-w>+')
call leadermap#map('<C-l>', '<C-w>-')
