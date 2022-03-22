vim.fn["leadermap#cmap"](',', 'HopWord')
vim.fn["leadermap#cmap"]('.', 'HopLine')
vim.fn["leadermap#cmap"]('/', 'HopPattern')
vim.fn["leadermap#cmap"]('m', 'HopChar1')
vim.fn["leadermap#cmap"]('n', 'HopChar2')

require('hop').setup {
  quit_key = ',',
}
