set nocompatible

" Appearance
set number
set hidden
set cursorline
set visualbell
set list
set listchars=tab:\|-,trail:.

filetype off
filetype plugin indent off
syntax off

" Fix backspace behavior
noremap! <C-?> <BS>
noremap! <C-M> <CR>

" Change Cursor Shape
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"

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
set clipboard^=unnamedplus
