set runtimepath+=$HOME/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '/.dein')
  call dein#begin($HOME . '/.dein')

  call dein#load_toml($HOME . '/.vim/dein.toml', {'lazy': 0})
  call dein#load_toml($HOME . '/.vim/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()

endif
