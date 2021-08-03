vim.opt.runtimepath:append(vim.env.HOME .. "/.dein/repos/github.com/Shougo/dein.vim")
if vim.call('dein#load_state', vim.env.HOME .. '/.dein') then
  vim.call('dein#begin', vim.env.HOME .. '/.dein')
  vim.call('dein#load_toml', vim.env.HOME .. '/.config/nvim/dein.toml', {lazy = 0})
  vim.call('dein#load_toml', vim.env.HOME .. '/.config/nvim/dein_lazy.toml', {lazy = 1})
  vim.call('dein#end')
  vim.call('dein#save_state')
end
