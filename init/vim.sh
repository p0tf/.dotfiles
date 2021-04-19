#!/bin/sh
set -e

_main() {
    local cur_dir=`pwd`
    if ! which git; then
        echo [ERROR] \"git\" is missing. Please install.
        return 1
    elif ! which vim; then
        echo [ERROR] \"vim\" is missing. Please install.
        return 1
    fi

    if ! [ -d $HOME/.dein ]; then
      mkdir -p $HOME/.dein/repos/github.com/Shougo/
      cd $HOME/.dein/repos/github.com/Shougo/
      git clone https://github.com/Shougo/dein.vim.git
    fi

    cd $cur_dir
    vim  -c "call dein#install()" -c "quit"
    echo

}

_main

cat << EOF > ~/.nvim_startup
#!/bin/sh
sleep 0.1
nvim
EOF
chmod +x ~/.nvim_startup
