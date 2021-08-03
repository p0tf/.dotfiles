vim.g.vsnip_snippet_dir = vim.env.HOME .. '/.config/nvim/snippets'
vim.g.snips_author = vim.fn.trim(vim.fn.system('git config user.name'))

vim.api.nvim_set_keymap('i', '<Tab>', "vsnip#expandable() ? '<Plug>(vsnip-expand-or-jump) : '<Tab>'", { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', "vsnip#expandable() ? '<Plug>(vsnip-expand-or-jump) : '<Tab>'", { expr = true })

vim.api.nvim_set_keymap('i', '<S-Tab>', "vsnip#expandable() ? '<Plug>(vsnip-jump-prev) : '<S-Tab>'", { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', "vsnip#expandable() ? '<Plug>(vsnip-jump-prev) : '<S-Tab>'", { expr = true })
vim.api.nvim_set_keymap('n', 's', '<Plug>(vsnip-cut-text)', {})
vim.api.nvim_set_keymap('x', 's', '<Plug>(vsnip-cut-text)', {})
