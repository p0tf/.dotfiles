inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " <C-\><C-o>:call <SID>Quote('"')<CR>
inoremap ' <C-\><C-o>:call <SID>Quote("'")<CR>
inoremap ) <C-\><C-o>:call <SID>CloseBracket(')')<CR>
inoremap } <C-\><C-o>:call <SID>CloseBracket('}')<CR>
inoremap ] <C-\><C-o>:call <SID>CloseBracket(']')<CR>
inoremap (<Enter> ()<Left><CR><Esc><S-o>
inoremap {<Enter> {}<Left><CR><Esc><S-o>
inoremap [<Enter> []<Left><CR><Esc><S-o>

function! s:Quote(char)
  if col(".") == col("$")
    call feedkeys(a:char . a:char . "\<Left>", 'n')
  elseif getline('.')[col('.')-1] ==# a:char
    call feedkeys("\<Right>", 'n')
  else
    call feedkeys(a:char . a:char . "\<Left>", 'n')
  endif
endfunction

function! s:CloseBracket(char)
  if col(".") == col("$")
    call feedkeys(a:char, 'n')
  elseif getline('.')[col('.')-1] ==# a:char
    call feedkeys("\<Right>", 'n')
  else
    call feedkeys(a:char, 'n')
  endif
endfunction
