let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '

let g:gitgutter_sign_priority = 9

nnoremap <Space>gp :GitGutterPreviewHunk<CR>
nnoremap <Space>g< :GitGutterStageHunk<CR>
nnoremap <Space>g> :GitGutterUndoHunk<CR>
