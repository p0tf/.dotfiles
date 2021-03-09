let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\       'left': [['mode'], ['filename', 'modified']],
\       'right': [['lineinfo'], ['git']]
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
  if i == 'i'
    let m = 'INS'
  elseif i == 'c'
    let m = 'CMD'
  elseif i == 'n'
    let m = 'NOR'
  elseif i == 'R'
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
  if len(name) == 0
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
  let symbol = ' '
  let branch = gina#component#repo#branch()
  if len(branch) == 0
    return symbol . '[None]'
  endif

  if ! exists('*GitGutterGetHunkSummary') ||
\    ! get(g:, 'gitgutter_enabled', 0) ||
\    winwidth('.') <= 90
    return symbol . branch
  endif

  let signs = [
\   g:gitgutter_sign_added,
\   g:gitgutter_sign_modified,
\   g:gitgutter_sign_removed
\ ]
  let hunks = GitGutterGetHunkSummary()
  let gitgutter = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(gitgutter, signs[i] . hunks[i])
    endif
  endfor

  let gitgutter = join(gitgutter, ' ')

  if len(gitgutter) == 0
    return symbol . branch
  else
    return symbol . branch . ' (' . gitgutter . ')'
  endif
endfunction
