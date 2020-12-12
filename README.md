# My dotfiles
## Install
```shell
$ curl -L git.io/dot-pm | sh
```
## Update
```shell
$ cd ~/.dotfiles
$ git pull
$ yes | ./install.sh
```
## Dependencies
- Common
    - Needed
        - `git`
        - `which`
- `.config/nvim`
    - Needed
        - `nvim`
        - `python-pynvim`
    - Optional
        - `python-jedi`
        - `rust`
        - `rust-racer`
        - `crystal`
        - `xclip` or `xsel`
- `.config/alacritty.yml`
    - Needed
        - `alacritty`
- `.config/fish`
    - Needed
        - `fish`
- `.editorconfig`
    - Needed
        - `editorconfig-vim`
