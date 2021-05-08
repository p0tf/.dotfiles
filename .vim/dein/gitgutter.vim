let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''

let g:gitgutter_sign_priority = 9

let g:gitgutter_map_keys = 0
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)

nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>g< :GitGutterStageHunk<CR>
nnoremap <Leader>g> :GitGutterUndoHunk<CR>
