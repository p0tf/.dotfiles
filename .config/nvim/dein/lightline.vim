let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\       'left': [['mode'], ['filename', 'modified']],
\       'right': [['lineinfo'], ['git'], ['ale-checking', 'ale-errors', 'ale-warnings', 'ale-ok']]
\   },
\   'component': {
\       'lineinfo': '%l:%c(%p%%)'
\   },
\   'component_function': {
\       'mode': 'Mode',
\       'git':  'Git',
\       'filename': 'FileName',
\       'modified': 'Modified'
\   },
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

function! FileName()
  let icon = nerdfont#find()
  let name = expand('%:t')
  if len(name) =~ 0
    return '[No Name]'
  else
    return icon . ' ' . name
  endif
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

function! Git()
  let branch = gina#component#repo#branch()
  if len(branch) =~ 0
    return ' [None]'
  else
    return ' ' . gina#component#repo#branch()
  endif
endfunction
