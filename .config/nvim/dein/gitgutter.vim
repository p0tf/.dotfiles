let g:gitgutter_sign_added = ' '
let g:gitgutter_sign_modified = ' '
let g:gitgutter_sign_removed = ' '

nnoremap <Space>gp :GitGutterPreviewHunk<CR>
nnoremap <Space>g< :GitGutterStageHunk<CR>
nnoremap <Space>g> :GitGutterUndoHunk<CR>
