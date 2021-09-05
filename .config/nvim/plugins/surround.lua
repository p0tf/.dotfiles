local mw = {'char', 'line', 'block'}

vim.g['operator#surround#blocks'] = {
  ['-'] = {
    {block={'(', ')'}, motionwise=mw, keys={'p'}},
    {block={'( ', ' )'}, motionwise=mw, keys={'P'}},
    {block={'{', '}'}, motionwise=mw, keys={'c'}},
    {block={'{ ', ' }'}, motionwise=mw, keys={'C'}},
    {block={'[', ']'}, motionwise=mw, keys={'s'}},
    {block={'[ ', ' ]'}, motionwise=mw, keys={'S'}},
    {block={'<', '>'}, motionwise=mw, keys={'a'}},
    {block={'< ', ' >'}, motionwise=mw, keys={'A'}},
    {block={"'", "'"}, motionwise=mw, keys={'q'}},
    {block={"'''", "'''"}, motionwise=mw, keys={'Q'}},
    {block={'"', '"'}, motionwise=mw, keys={'d'}},
    {block={'"""', '"""'}, motionwise=mw, keys={'D'}},
    {block={'`', '`'}, motionwise=mw, keys={'b'}},
    {block={'```', '```'}, motionwise=mw, keys={'B'}},
  },
  rust = {
    {block={'r#"', '"#'}, motionwise=mw, keys={'r'}},
    {block={'br#"', '"#'}, motionwise=mw, keys={'R'}},
  },
  lua = {
    {block={'[[', ']]'}, motionwise=mw, keys={'l'}},
  },
}

vim.api.nvim_set_keymap('n', 'sa', '<Plug>(operator-surround-append)', {silent=true})
vim.api.nvim_set_keymap('n', 'su', '<Plug>(operator-surround-delete)', {silent=true})
vim.api.nvim_set_keymap('n', 'sr', '<Plug>(operator-surround-replace)', {silent=true})
