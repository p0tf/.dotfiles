if executable('fcitx5')
   autocmd InsertLeave * :call system('fcitx5-remote -c')
   autocmd CmdlineLeave * :call system('fcitx5-remote -c')
endif

if executable('ibus')
   autocmd InsertLeave * if mode() != 'i' | call system('ibus engine xkb:us::eng')
   autocmd CmdlineLeave * if mode() != 'c' | call system('ibus engine xkb:us::eng')
endif
