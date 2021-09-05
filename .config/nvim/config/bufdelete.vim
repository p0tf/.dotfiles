function ExitOnBufferDelete() abort
  if len(filter(range(1, bufnr('$')), { _, val -> buflisted(v:val)})) is# 2
    execute('quit')
  endif
endfunction

augroup bufdelete
  autocmd!
  autocmd BufWipeout * call ExitOnBufferDelete()
augroup END
