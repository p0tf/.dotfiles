execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
set termguicolors

command! -nargs=0 Dark call s:dark()
command! -nargs=0 Light call s:light()

function! s:dark()
  set background=dark
  colorscheme onedark
endfunction

function! s:light()
  set background=light
  colorscheme one
endfunction

if 18 <= strftime("%H") && strftime("%H") < 22
  let g:lightline.colorscheme = "onedark"
  Dark
else
  let g:lightline.colorscheme = "one"
  Light
endif
