let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\       'left': [['mode'], ['git', 'filename', 'modified']],
\       'right': [['lineinfo'], ['filetype'], ['ale-checking', 'ale-errors', 'ale-warnings', 'ale-ok']]
\   },
\   'component': {
\       'lineinfo': '%l:%c(%p%%)'
\   },
\   'component_function': {
\       'git': "FugitiveHead",
\       'mode': 'Mode',
\       'modified': 'Modified'
\   }
\ }

function! Mode()
  let i = mode()
  if i =~ 'i'
    let m = 'INS'
  elseif i =~ 'c'
    let m = 'CMD'
  elseif i =~ 'n'
    let m = 'NOR'
  elseif i =~ 'R'
    let m = 'REP'
  else
    let m = 'VIS'
  endif

  if &paste
    let p = '(PAS)'
  else
    let p = ''
  endif

  return m . p
endfunction

function! Modified()
  if &readonly && &modified
    return '!'
  elseif &readonly
    return '-'
  elseif &modified
    return '+'
  endif

  return ''
endfunction
