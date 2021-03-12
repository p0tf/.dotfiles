" Appearance
set number
set hidden
set cursorline
set visualbell
set list
set listchars=tab:\|-,trail:.

" Indent Behavior
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

let mapleader=","

" jk = <Esc>
inoremap jk <Esc>

" Disable arrow keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

" Clipboard support
if has('clipboard')
    set clipboard+=unnamedplus
endif
