let g:vista_default_executive = "vim_lsp"
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#icons = {
\ 'func': "",
\ 'function': "",
\ 'functions': "",
\ 'var': "",
\ 'variable': "",
\ 'variables': "",
\ 'const': "",
\ 'constant': "",
\ 'method': "",
\ 'package': " ",
\ 'packages': " ",
\ 'enum': "﬘",
\ 'enummember': "",
\ 'enumerator': "﬘",
\ 'module': "",
\ 'modules': "",
\ 'type': " 﫳",
\ 'typedef': "",
\ 'types': "﫳",
\ 'field': " ",
\ 'fields': " ",
\ 'macro': "",
\ 'macros': "",
\ 'struct': "",
\ 'member': "",
\ 'property': "襁",
\ 'interface': "",
\ 'namespace': "",
\ 'implementation': "",
\ 'typeParameter': " ",
\ 'default': " "
\}

nnoremap <silent> <Leader>gs :<C-u>Vista!!<CR>
nnoremap <silent> <C-s> :<C-u>Vista finder<CR>
