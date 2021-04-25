nnoremap <Space>U :call<Space>lightline#update()<CR>

augroup LightLineColorscheme
  autocmd!
  autocmd ColorScheme * call s:lightline_update()
augroup END

function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    let g:lightline.colorscheme = g:colors_name
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  catch
  endtry
endfunction

set laststatus=2
let g:lightline = {
\   'active': {
\       'left': [['mode'], ['filename', 'modified']],
\       'right': [['lineinfo'], ['git'], ['lsp-ok', 'lsp-error', 'lsp-warn', 'lsp-info', 'lsp-hint']]
\   },
\   'inactive': {
\       'left': [['filename', 'modified']],
\       'right': [['lineinfo']]
\   },
\   'tab': {
\     'active': [ 'tabnum', 'filename', 'modified' ],
\     'inactive': [ 'tabnum', 'filename', 'modified' ]
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
\   'tab_component_function': {
\     'filename': 'TabFileName',
\     'modified': 'TabModified',
\   }
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
  elseif i ==# 'v'
    let m = 'VIS'
  elseif i ==# 'V'
    let m = 'VIS LINE'
  elseif i == "\<C-v>"
    let m = 'VIS BLOCK'
  else
    let m = 'TER'
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

function! TabFileName(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = expand('#' . buflist[winnr - 1] . ':t')
  let icon = nerdfont#find(name)
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

function! TabModified(n)
  let winnr = tabpagewinnr(a:n)
  let modified = gettabwinvar(a:n, winnr, '&modified')
  let readonly = gettabwinvar(a:n, winnr, '&readonly')

  if readonly && modified
    return '[!]'
  elseif readonly
    return '[-]'
  elseif modified
    return '[+]'
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
