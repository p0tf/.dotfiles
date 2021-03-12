let gh_token = $HOME . '/.dein/github_token'
if filereadable(gh_token)
  let gh_token = readfile(gh_token)
  if len(gh_token) == 1
    let g:dein#install_github_api_token = gh_token[0]
    call dein#check_update(v:true)
  endif
else
  echo 'Set github api token to ~/.dein/github_token.'
endif
