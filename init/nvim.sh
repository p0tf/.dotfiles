#!/bin/sh
set -e

_main() {
    local cur_dir=`pwd`
    if ! which git; then
        echo [ERROR] \"git\" is missing. Please install.
        return 1
    elif ! which nvim; then
        echo [ERROR] \"nvim\" is missing. Please install.
        return 1
    fi

    if ! [ -d $HOME/.dein ]; then
      mkdir -p $HOME/.dein/repos/github.com/Shougo/
      cd $HOME/.dein/repos/github.com/Shougo/
      git clone https://github.com/Shougo/dein.vim.git
    fi

    cd $cur_dir
    nvim  -c "call dein#install()" -c "UpdateRemotePlugins" -c "quit"
    echo

}

_main
