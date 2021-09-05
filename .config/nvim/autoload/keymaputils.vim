function! keymaputils#map(mode, key, cmd)
  execute(a:mode . 'noremap <Leader>' . a:key . ' ' . a:cmd)
endfunction

function! keymaputils#cmap(mode, key, cmd)
  execute(a:mode . 'noremap <silent> <Leader>' . a:key . ' :<C-u>' . a:cmd . '<CR>')
endfunction

function! keymaputils#smap(mode, key, cmd1, cmd2)
  execute(a:mode . 'noremap [' . a:key . ' ' . a:cmd1)
  execute(a:mode . 'noremap ]' . a:key . ' ' . a:cmd2)
endfunction

function! keymaputils#ssmap(mode, key, cmd1, cmd2)
  execute(a:mode . 'noremap [[' . a:key . ' ' . a:cmd1)
  execute(a:mode . 'noremap ]]' . a:key . ' ' . a:cmd2)
endfunction

function! keymaputils#csmap(mode, key, cmd1, cmd2)
  execute(a:mode . 'noremap <silent> [' . a:key . ' :<C-u>' . a:cmd1 . '<CR>')
  execute(a:mode . 'noremap <silent> ]' . a:key . ' :<C-u>' . a:cmd2 . '<CR>')
endfunction

function! keymaputils#cssmap(mode, key, cmd1, cmd2)
  execute(a:mode . 'noremap <silent> [[' . a:key . ' :<C-u>' . a:cmd1 . '<CR>')
  execute(a:mode . 'noremap <silent> ]]' . a:key . ' :<C-u>' . a:cmd2 . '<CR>')
endfunction
