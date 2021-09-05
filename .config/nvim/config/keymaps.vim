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
call keymaputils#cmap('n', 'c', 'bwipeout')
call keymaputils#cmap('n', 'x', 'write <Bar> :bwipeout')
call keymaputils#cmap('n', 's', 'new')
call keymaputils#cmap('n', 'S', 'split')
call keymaputils#cmap('n', 'v', 'vnew')
call keymaputils#cmap('n', 'V', 'vsplit')
call keymaputils#map('n', 'h', '<C-w>h')
call keymaputils#map('n', 'j', '<C-w>j')
call keymaputils#map('n', 'k', '<C-w>k')
call keymaputils#map('n', 'l', '<C-w>l')
call keymaputils#map('n', 'H', '<C-w>H')
call keymaputils#map('n', 'J', '<C-w>J')
call keymaputils#map('n', 'K', '<C-w>K')
call keymaputils#map('n', 'L', '<C-w>L')
call keymaputils#map('n', '=', '<C-w>=')
call keymaputils#map('n', '<C-h>', '<C-w><')
call keymaputils#map('n', '<C-l>', '<C-w>>')
call keymaputils#map('n', '<C-l>', '<C-w>+')
call keymaputils#map('n', '<C-l>', '<C-w>-')
