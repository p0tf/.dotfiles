nmap <C-a> <Plug>(dps-dial-increment)
nmap <C-x> <Plug>(dps-dial-decrement)
xmap <C-a> <Plug>(dps-dial-increment)
xmap <C-x> <Plug>(dps-dial-decrement)
xmap g<C-a> <Plug>(dps-dial-increment)
xmap g<C-x> <Plug>(dps-dial-decrement)

let g:dps_dial#augends = [
\ 'date-slash',
\ 'decimal-integer',
\ 'hex',
\ 'octal',
\ 'binary',
\ {'kind': 'constant', 'opts': {'elements': ['true', 'false']}},
\ {'kind': 'constant', 'opts': {'elements': ['let', 'const']}},
\ {'kind': 'constant', 'opts': {'elements': ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'], 'word': v:false, 'cyclic': v:false}},
\ {'kind': 'constant', 'opts': {'elements': ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'], 'word': v:false, 'cyclic': v:false}},
\]
