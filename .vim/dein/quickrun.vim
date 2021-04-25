let g:quickrun_config = {
\ '_' : {
\   'outputter/buffer/split': ':botright',
\   'outputter/buffer/close_on_empty': 1,
\   'runner': 'terminal',
\ },
\ 'rust': {
\   'exec': 'cargo run'
\ }
\}

let g:quickrun_no_default_key_mappings = 0
nnoremap <Leader>q :<C-u>QuickRun<Space>
nnoremap <silent> <Leader>Q :<C-u>QuickRun<CR>
