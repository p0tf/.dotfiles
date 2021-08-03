if vim.fn.executable('fcitx5') then
  vim.cmd[[
  augroup fcitx_cmd
    autocmd!
    autocmd InsertLeave * :call system("fcitx5-remote -c")
    autocmd CmdlineLeave * :call system("fcitx5-remote -c")
  augroup END
  ]]
end
