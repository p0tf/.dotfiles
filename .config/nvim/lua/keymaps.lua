vim.g.mapleader = ' '

local u = require('utils')

-- Exit by "jk"
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})

-- Remove Search Highlight
vim.api.nvim_set_keymap('n', '<Esc>', ':<C-u>nohlsearch<CR>', {noremap = true, silent = true})


-- Clipboard
vim.api.nvim_set_keymap('n', 'sp', '"+p', {noremap = true})
vim.api.nvim_set_keymap('n', 'sy', '"+y', {noremap = true})

-- Windows
u.cmap('n', 's', 'new')
u.cmap('n', 'S', 'split')
u.cmap('n', 'v', 'vnew')
u.cmap('n', 'V', 'vsplit')
u.map('n', 'h', '<C-w>h')
u.map('n', 'j', '<C-w>j')
u.map('n', 'k', '<C-w>k')
u.map('n', 'l', '<C-w>l')
u.map('n', 'H', '<C-w>H')
u.map('n', 'J', '<C-w>J')
u.map('n', 'K', '<C-w>K')
u.map('n', 'L', '<C-w>L')
u.map('n', '=', '<C-w>=')
u.map('n', '<C-h>', '<C-w><')
u.map('n', '<C-l>', '<C-w>>')
u.map('n', '<C-k>', '<C-w>+')
u.map('n', '<C-j>', '<C-w>-')
