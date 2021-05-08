set nocompatible

" Appearance
set number
set hidden
set cursorline
set visualbell
set list
set listchars=tab:\|-,trail:.
set wildmenu
set wildmode=longest,list

filetype off
filetype plugin indent off
syntax off

" Fix backspace behavior
noremap! <C-?> <BS>

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

let mapleader=" "

" jk = <Esc>
inoremap jk <Esc>

" Disable arrow keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>

" Enable Mouse
set mouse=a
set ttymouse=xterm2
nnoremap <ScrollWheelDown> 3j
nnoremap <ScrollWheelUp> 3k

" Clipboard support
set clipboard^=unnamedplus

" Terminal Config
tnoremap <F1> <C-W>N
tnoremap <ScrollWheelDown> <C-W>N<ScrollWheelDown>
tnoremap <ScrollWheelUp> <C-W>N<ScrollWheelUp>
autocmd TerminalOpen * call s:term_start()

function s:term_start()
  setlocal nonumber
  setlocal nolist
  setlocal noexpandtab
  setlocal noautoindent
  setlocal nosmartindent
endfunction

" GUI
if has('gui')
  set guioptions=agci
  set guicursor+=a:blinkon0
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
endif
