function! s:line_moved()
  let linenum = line('.')
  if get(b:, 'linenum', 1) != linenum
    let b:linenum = linenum
    doautocmd User LineMoved
  endif
endfunction

augroup linechanged
  autocmd!
  autocmd CursorMoved * call s:line_moved()
augroup END
