local u = require('utils')
u.cmap('n', 't', 'Telescope')
u.cmap('n', 'tt', 'Telescope')
u.cmap('n', 'tb', 'Telescope buffers')
u.cmap('n', 'tg', 'Telescope live_grep')
u.cmap('n', 'th', 'Telescope help_tags')
u.cmap('n', 'ts', 'Telescope lsp_workspace_symbols')
u.cmap('n', 'td', 'Telescope lsp_workspace_diagnostics')

if vim.fn.isdirectory('.git') then
  u.cmap('n', 'tf', 'Telescope git_files')
else
  u.cmap('n', 'tf', 'Telescope find_files')
end
