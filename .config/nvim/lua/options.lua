-- Appearance
vim.o.number = true
vim.o.cursorline = true
vim.o.list = true
vim.o.listchars = [[tab:|-,trail:.]]
vim.o.termguicolors = true

-- Indents
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true

-- Windows
vim.o.splitright = true
vim.o.splitbelow = true

-- Completion
vim.o.completeopt = "menuone,noselect"

-- Statusline
if vim.fn.exists('g:started_by_firenvim') == 1 then
  vim.o.laststatus = 0
end

vim.o.clipboard="unnamed"

-- Buffers
vim.o.hidden = true
