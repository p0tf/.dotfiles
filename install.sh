#!/bin/sh
# Exit when error occurred.
set -e

_yes_no() {
    echo -n "$1 "
    if [ x$2 = "xn" ];then
        read -p "[y/N]: " ans
        case $ans in
        [Yy]* ) return 0;;
        * ) return 1;;
        esac
    else
        read -p "[Y/n]: " ans
        case $ans in
        [Nn]* ) return 1;;
        * ) return 0;;
        esac
    fi
}

_main() {
    local cur_dir=`pwd`

    # If environment is not initialized yet, intialize now.
    if [ ! -d $HOME/.dotfiles ];then
        cd $HOME
        echo [INFO] Main directory is missing. Now retrieving.
        if which git; then
            echo "[ERROR] \"git\" is missing. Please install."
            return 1
        fi
        git clone https://github.com/watcol/.dotfiles.git
    fi

    cd $HOME/.dotfiles/

    # Ignore denylist
    for f in `find | cut -c3- | grep -Pv '^($|.git|init|README.md|LICENSE|install.sh)'`;do

        if [ -d $f ] && [ ! -e $HOME/$f ];then
            mkdir $HOME/$f
        elif [ -f $f ];then
            if [ ! -e $HOME/$f ];then
                ln -s $f $HOME/$f
                echo [INFO] File \"$f\" is successfully linked.
            elif _yes_no "[WARN] File $HOME/$f exists. Overwrite?" n ;then
                rm $HOME/$f
                ln -s $HOME/.dotfiles/$f $HOME/$f
                echo [INFO] $f is successfully linked.
            fi
        fi
    done

    for f in `ls -1 init/`;do
        if [ -x init/$f ] && _yes_no "[INFO] Do you want to run init/$f?" y ;then
            $f
        fi
    done

    cd $cur_dir
    echo [INFO] All done!
}

_main
