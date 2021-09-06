call system('git rev-parse --show-toplevel')
if v:shell_error
  call leadermap#cmap('fg', 'Files')
else
  call leadermap#cmap('fg', 'GFiles')
  call leadermap#cmap('fd', 'GFiles?')
endif

call leadermap#cmap('f', 'Rg')
call leadermap#cmap('ff', 'Rg')
call leadermap#cmap('fh', 'Helptags')
call leadermap#cmap('fb', 'Buffers')
