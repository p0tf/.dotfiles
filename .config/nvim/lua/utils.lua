function map(mode, key, cmd)
  vim.api.nvim_set_keymap(mode, '<leader>' .. key, cmd, {noremap = true})
end

function cmap(mode, key, cmd)
  vim.api.nvim_set_keymap(mode, '<leader>' .. key, ':<C-u>' .. cmd .. '<CR>', {noremap = true, silent = true})
end

function smap(mode, key, cmd1, cmd2)
  vim.api.nvim_set_keymap(mode, '[' .. key, cmd1, {noremap = true})
  vim.api.nvim_set_keymap(mode, ']' .. key, cmd2, {noremap = true})
end

function ssmap(mode, key, cmd1, cmd2)
  vim.api.nvim_set_keymap(mode, '[[' .. key, cmd1, {noremap = true})
  vim.api.nvim_set_keymap(mode, ']]' .. key, cmd2, {noremap = true})
end

function csmap(mode, key, cmd1, cmd2)
  vim.api.nvim_set_keymap(mode, '[' .. key, ':<C-u>' .. cmd1 .. '<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap(mode, ']' .. key, ':<C-u>' .. cmd2 .. '<CR>', {noremap = true, silent = true})
end

function cssmap(mode, key, cmd1, cmd2)
  vim.api.nvim_set_keymap(mode, '[[' .. key, ':<C-u>' .. cmd1 .. '<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap(mode, ']]' .. key, ':<C-u>' .. cmd2 .. '<CR>', {noremap = true, silent = true})
end

return {
  map = map,
  cmap = cmap,
  smap = smap,
  csmap = csmap,
  ssmap = ssmap,
  cssmap = cssmap,
}
