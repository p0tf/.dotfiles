" Appearance
set number
set list
set listchars=tab:\|-,trail:.
" set termguicolors
execute "set background=" . $BACKGROUND
set fillchars+=vert:│
colorscheme 16colors

set noshowmode
set noruler
set noshowcmd

" Indents
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Search
set ignorecase
set smartcase

" Windows
set splitright
set splitbelow
" set pumblend=20
" set winblend=20

" Completes
set completeopt=menu,menuone,noinsert
set pumheight=15
set updatetime=1500

" Buffers
set inccommand=split
set clipboard=unnamed
set hidden

" statusline
function! s:change_statusline() abort
  let nr = winnr()
  echo l:nr
  " check if a window exists below current window.
  if l:nr isnot# winnr('j')
    setlocal laststatus=2
    exec 'setlocal statusline=' . repeat('─', winwidth(l:nr))
    " exec 'setlocal statusline=' . repeat('─', 250)
  else
    echo 'hiden'
    setlocal laststatus=0
  endif
endfunction

function! s:statusline_update() abort
  for w in range(1, winnr('$'))
    let type = win_gettype(w)
    if l:type ==# '' || l:type ==# 'command' || l:type ==# 'loclist' || l:type ==# 'quickfix'
      noautocmd call win_execute(win_getid(w), 'call s:change_statusline()')
    endif
  endfor
endfunction

augroup statuslines
  autocmd!
  autocmd User WinResized                call s:statusline_update()
  autocmd VimEnter,WinEnter,VimResized * call s:statusline_update()
augroup END

