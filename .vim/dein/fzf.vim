let $FZF_PREVIEW_COMMAND="bat --style=auto --theme=ansi --color=always {}"
let $FZF_DEFAULT_OPTS="--reverse"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

nnoremap <silent> <C-b> :<C-u>Buffers<CR>
nnoremap <silent> <C-c> :<C-u>GFiles?<CR>
nnoremap <silent> <C-e> :<C-u>GFiles<CR>
nnoremap <silent> <C-E> :<C-u>Files<CR>
nnoremap <silent> <C-h> :<C-u>Helptags<CR>
nnoremap <silent> <C-l> :<C-u>Lines<CR>
nnoremap <silent> <C-g> :<C-u>Rg<CR>
