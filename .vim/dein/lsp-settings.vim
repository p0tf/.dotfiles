let g:lsp_settings_filetype_rust = 'rust-analyzer'
let g:lsp_settings = {
\ 'rust-analyzer': {
\   'workspace_config': {
\     'rust-analyzer': {
\       'checkOnSave': {
\         'allFeatures': v:true,
\         'command': 'clippy',
\       }
\     }
\   }
\ }
\}
