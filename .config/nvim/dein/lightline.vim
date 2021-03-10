let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\       'left': [['mode'], ['filename', 'modified']],
\       'right': [['lineinfo'], ['git'], ['lsp-ok', 'lsp-error', 'lsp-warn', 'lsp-hint', 'lsp-info']]
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
\   'component_expand': {
\     'lsp-ok': 'LspOk',
\     'lsp-error': 'LspError',
\     'lsp-warn': 'LspWarn',
\     'lsp-hint': 'LspHint',
\     'lsp-info': 'LspInfo',
\   },
\   'component_type': {
\     'lsp-ok': 'right',
\     'lsp-error': 'error',
\     'lsp-warn': 'warning',
\     'lsp-hint': 'warning',
\     'lsp-info': 'right',
\   },
\   'tab_component_function': {
\     'filename': 'TabFileName',
\     'modified': 'TabModified',
\   }
\ }

augroup OnLSP
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END

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

function! LspOk()
  if lsp#get_server_status() == ''
    return ''
  endif

  let counts =  lsp#get_buffer_diagnostics_counts()
  let total = counts.error + counts.warning + counts.information + counts.hint
  if total == 0
    return ' OK'
  else
    return ''
  endif
endfunction

function! LspError()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().error
  let sign = g:lsp_diagnostics_signs_error.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction

function! LspWarn()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().warning
  let sign = g:lsp_diagnostics_signs_warning.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction

function! LspHint()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().hint
  let sign = g:lsp_diagnostics_signs_hint.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction

function! LspInfo()
  if lsp#get_server_status() == ''
    return ''
  endif

  let count = lsp#get_buffer_diagnostics_counts().information
  let sign = g:lsp_diagnostics_signs_information.text
  if count == 0
    return ''
  else
    return sign . count
  end
endfunction
