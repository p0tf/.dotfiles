let g:scrollbar_shape = {
\ 'head': '▗',
\ 'body': '▐',
\ 'tail': '▝',
\ }

let g:scrollbar_highlight = {
\ 'head': 'Whitespace',
\ 'body': 'Whitespace',
\ 'tail': 'Whitespace',
\ }

let g:scrollbar_min_size = 1
let g:scrollbar_right_offset = 0

function! s:show_scrollbar()
  lua require('scrollbar').show()
  if exists('s:timer')
    call timer_stop(s:timer)
  endif
  let s:timer = timer_start(1000, funcref('s:clear_scrollbar'))
endfunction

function! s:clear_scrollbar(timer)
  lua require('scrollbar').clear()
endfunction

augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled              * silent! call s:show_scrollbar()
  autocmd BufLeave,BufWinLeave     * silent! call s:clear_scrollbar(0)
  autocmd WinLeave,FocusLost       * silent! call s:clear_scrollbar(0)
augroup end
