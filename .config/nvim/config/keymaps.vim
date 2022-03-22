let mapleader=','
nnoremap <Leader>; :

" Exit
inoremap jk <Esc>
inoremap <C-a> <Esc>

" Remove Search Highlight
nnoremap <silent> <Esc> :<C-u>nohlsearch<CR>

" Swap j and gj
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" map $ to ;
" swap 0 and ^
nnoremap ; $
nnoremap 0 ^
nnoremap ^ 0

" Macros
nnoremap <expr> q reg_recording() == 'q' ? 'q' : 'qq'
nnoremap @ @q

" Move cursor in insert mode.
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Disable PageDown/PageUp
nnoremap <PageDown> <Nop>
nnoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>
cnoremap <PageDown> <Nop>
cnoremap <PageUp> <Nop>
xnoremap <PageDown> <Nop>
xnoremap <PageUp> <Nop>

" Clipboard
nnoremap sp "+p
nnoremap sy "+y
nnoremap sd "+d
xnoremap sy "+y
xnoremap sd "+d

" Windows
call leadermap#cmap('z', 'write')
call leadermap#cmap('Z', 'write')
call leadermap#cmap('q', 'quit')
call leadermap#cmap('Q', 'quit!')
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
call leadermap#map('<C-j>', '<C-w>+')
call leadermap#map('<C-k>', '<C-w>-')
