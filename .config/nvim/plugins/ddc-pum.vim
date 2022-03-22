let g:lexima_map_escape = '<Plug>(lexima-escape)'
let g:lexima_no_default_rules = v:true

function! s:puminit()
  call lexima#set_default_rules()
  call ddc#custom#patch_global('completionMenu', 'pum.vim')
  call ddc#custom#patch_global('autoCompleteEvents', ['InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'])

  imap <silent><expr> <Tab> pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : (vsnip#jumpable(1) <Bar><Bar> vsnip#expandable()) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
  imap <silent><expr> <S-Tab> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
  inoremap <silent><expr> <CR> pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : lexima#expand('<LT>CR>', 'i')
  imap <silent><expr> <Esc> pum#visible() ? '<Cmd>call pum#map#cancel()<CR>' : '<Plug>(lexima-escape)'
  nnoremap : <Cmd>call CommandlinePre()<CR>:
  autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)
endfunction

function! CommandlinePre() abort
  let s:prev_buffer_config = ddc#custom#get_buffer()
  call ddc#custom#patch_buffer('sources', ['necovim', 'cmdline-history', 'file'])
  autocmd CmdlineLeave * ++once call CommandlinePost()

  cnoremap <silent><expr> <Tab> pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : '<Tab>'
  cnoremap <silent><expr> <S-Tab> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<S-Tab>'
  cnoremap <silent><expr> <CR> pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<CR>'
  cnoremap <silent><expr> <Esc> pum#visible() ? '<Cmd>call pum#map#cancel()<CR>' : '<Esc>'

  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  call ddc#custom#set_buffer(s:prev_buffer_config)
endfunction

augroup puminit
  autocmd!
  autocmd User DenopsReady call s:puminit()
augroup END
