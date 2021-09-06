function! leadermap#map(key, cmd)
  execute('nnoremap <Leader>' . a:key . ' ' . a:cmd)
endfunction

function! leadermap#cmap(key, cmd)
  execute('nnoremap <silent> <Leader>' . a:key . ' :<C-u>' . a:cmd . '<CR>')
endfunction

function! leadermap#pmap(key, cmd)
  execute('nmap <Leader>' . a:key . ' <Plug>(' . a:cmd . ')')
endfunction

function! leadermap#bmap(key, cmd)
  execute('nnoremap <buffer> <Leader>' . a:key . ' ' . a:cmd)
endfunction

function! leadermap#bcmap(key, cmd)
  execute('nnoremap <buffer> <silent> <Leader>' . a:key . ' :<C-u>' . a:cmd . '<CR>')
endfunction

function! leadermap#bpmap(key, cmd)
  execute('nmap <buffer> <Leader>' . a:key . ' <Plug>(' . a:cmd . ')')
endfunction

function! leadermap#smap(key, cmd1, cmd2)
  execute('nnoremap [' . a:key . ' ' . a:cmd1)
  execute('nnoremap ]' . a:key . ' ' . a:cmd2)
endfunction

function! leadermap#csmap(key, cmd1, cmd2)
  execute('nnoremap <silent> [' . a:key . ' :<C-u>' . a:cmd1 . '<CR>')
  execute('nnoremap <silent> ]' . a:key . ' :<C-u>' . a:cmd2 . '<CR>')
endfunction

function! leadermap#psmap(key, cmd1, cmd2)
  execute('nmap [' . a:key . ' <Plug>(' . a:cmd1 . ')')
  execute('nmap ]' . a:key . ' <Plug>(' . a:cmd2 . ')')
endfunction

function! leadermap#bsmap(key, cmd)
  execute('nnoremap <buffer> [' . a:key . ' ' . a:cmd1)
  execute('nnoremap <buffer> ]' . a:key . ' ' . a:cmd2)
endfunction

function! leadermap#bcsmap(key, cmd1, cmd2)
  execute('nnoremap <buffer> <silent> [' . a:key . ' :<C-u>' . a:cmd1 . '<CR>')
  execute('nnoremap <buffer> <silent> ]' . a:key . ' :<C-u>' . a:cmd2 . '<CR>')
endfunction

function! leadermap#bpsmap(key, cmd1, cmd2)
  execute('nmap <buffer> [' . a:key . ' <Plug>(' . a:cmd1 . ')')
  execute('nmap <buffer> ]' . a:key . ' <Plug>(' . a:cmd2 . ')')
endfunction
