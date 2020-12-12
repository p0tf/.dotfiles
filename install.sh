#!/bin/sh
# Exit when error occurred.
set -e

_yes_no() {
    echo -en "$1 "
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
        echo -e "\e[32m[INFO]\e[m Main directory is missing. Now retrieving."
        if ! which git; then
            echo -e "\e[31m[ERROR]\e[m \"git\" is missing. Please install."
            return 1
        fi
        git clone https://github.com/potfman/.dotfiles.git
    fi

    cd $HOME/.dotfiles/

    for f in `cat file_list`;do

        if [ ! -d `dirname $HOME/$f` ];then
            mkdir -p `dirname $HOME/$f`
        fi

        if [ -e $HOME/$f ] && ! _yes_no "\e[33m[WARN]\e[m File $HOME/$f exists. Overwrite?" n ;then
            echo -e "\e[33m[WARN]\e[m File $f is ignored."
        else
            ln -s $HOME/.dotfiles/$f $HOME/$f
            echo -e "\e[32m[INFO]\e[m $f is successfully linked."
        fi
    done

    for f in `ls -1 init/`;do
        if [ -x init/$f ] && _yes_no "\e[32m[INFO]\e[m Do you want to run init/$f?" y ;then
            init/$f
        fi
    done

    cd $cur_dir
    echo -e "\e[32m[INFO]\e[m All done!"
}

_main
