function! s:win_resized()
  let tmp = winwidth(winnr())
  if get(w:, 'winwidth', 0) isnot# tmp
    let w:winwidth = tmp
    let g:winwidth_changed = 1
  endif
endfunction

function! s:any_win_resized()
  let g:winwidth_changed = 0
  for w in range(1, winnr('$'))
    let type = win_gettype(w)
    if type ==# '' || type ==# 'command' || type ==# 'loclist' || type ==# 'quickfix'
      noautocmd call win_execute(win_getid(w), "call s:win_resized()")
    endif
  endfor
  if g:winwidth_changed is# 1
    doautocmd User WinResized
  endif
endfunction

augroup winresized
  autocmd!
  autocmd FocusGained,CursorHold,InsertEnter,CmdlineEnter,CursorMoved * call s:any_win_resized()
augroup END
