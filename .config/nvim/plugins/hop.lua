vim.fn["leadermap#cmap"](',', 'HopWord')
vim.fn["leadermap#cmap"]('.', 'HopLine')
vim.fn["leadermap#cmap"]('/', 'HopPattern')
vim.fn["leadermap#cmap"]('m', 'HopChar1')
vim.fn["leadermap#cmap"]('n', 'HopChar2')

vim.cmd[[
hi HopNextKey cterm=bold ctermfg=1
hi HopNextKey1 cterm=bold ctermfg=1
hi HopNextKey2 ctermfg=1
hi HopUnmatched ctermfg=7
hi HopCursor cterm=reverse
]]

require('hop').setup {
  quit_key = ',',
}
