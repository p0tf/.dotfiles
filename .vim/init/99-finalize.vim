set ambiwidth=double
filetype plugin indent on
syntax on

if has('gui_running')
  if get(g:, "edita_loaded", 0) != 1
    call edita#enable()
    terminal ++curwin
  endif
endif
