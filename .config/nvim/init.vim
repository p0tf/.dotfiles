set runtimepath+=$HOME/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '/.dein')
  call dein#begin($HOME . '/.dein')

  call dein#load_toml($HOME . '/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml($HOME . '/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif


set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set number
set cursorline
set visualbell
colorscheme onedark

set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" force exit on ^C
nnoremap <silent><C-c> :<C-u>qa!<CR>

" Brackets
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap () ()
inoremap {} {}
inoremap [] []
inoremap (<Enter> ()<Left><CR><Esc><S-o>
inoremap {<Enter> {}<Left><CR><Esc><S-o>
inoremap [<Enter> []<Left><CR><Esc><S-o>

" Tabpages
for n in range(1, 9)
    execute 'nnoremap <silent> ,'.n ':<C-u>tabnext'.n.'<CR>'
endfor
nnoremap <silent> ,j :<C-u>tabprevious<CR>
nnoremap <silent> ,k :<C-u>tabnext<CR>
nnoremap <silent> ,k :<C-u>tabnext<CR>
nnoremap <silent> ,^ :<C-u>tabfirst<CR>
nnoremap <silent> ,$ :<C-u>tablast<CR>
nnoremap <silent> ,c :<C-u>tabnew<CR>
nnoremap <silent> ,C :<C-u>tablast <bar> tabnew<CR>
nnoremap <silent> ,x :<C-u>tabclose<CR>
nnoremap <silent> ,X :<C-u>tabclose!<CR>
