#!/bin/sh
# Exit when error occurred.
set -e

_yes_no() {
    read -p "[WARN] File $1 exists. Overwrite? [y/N]: " ans
    case $ans in
        [Yy]* ) return 0;;
        * ) return 1;;
    esac
}

_main() {
    local cur_dir=`pwd`

    # If environment is not initialized yet, intialize now.
    if [ ! -d $HOME/.dotfiles ];then
        cd $HOME
        echo [INFO] Main directory is missing. Now retrieving.
        git clone https://github.com/watcol/.dotfiles.git
    fi

    cd $HOME/.dotfiles/

    # Ignore denylist
    for f in `find | grep -Pv '^./(.git|init|README.md|LICENSE|install.sh)'`;do

        if [ -d $f ] && [ ! -e $HOME/$f ];then
            mkdir $HOME/$f
        elif [ -f $f ];then
            if [ ! -e $HOME/$f ];then
                ln -s $f $HOME/$f
                echo [INFO] File \"$f\" is successfully linked.
            elif _yes_no $HOME/$f;then
                rm $HOME/$f
                ln -s $f $HOME/$f
                echo [INFO] $f is successfully linked.
            fi
        fi
    done

    for f in `ls -1 init/`;do
        if [ -x $f ];then
            echo [INFO] Run a configure script \"$f\".
            $f
        fi
    done

    cd $cur_dir
    echo [INFO] All done!
}

_main
