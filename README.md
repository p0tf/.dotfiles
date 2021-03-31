# My dotfiles
## Install
```shell
$ curl -L git.io/watc_df | sh
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
    - Optional
        - `xclip` or `xsel`
- `.config/alacritty.yml`
    - Needed
        - `alacritty`
- `.config/fish`
    - Needed
        - `fish`
- `.config/i3`
    - Needed
        - `i3-gaps`
    - Optional
        - `xfce4-panel`
        - `xfce4-notifyd`
        - `xfce-polkit`
        - `ibus`
        - `feh`
        - `xss-lock`
        - `i3lock-color` (`i3lock-arc-dark`)
        - `picom`
- `.config/picom.conf`
    - Needed
        - `picom`
- `.config/rofi`
    - Needed
        - `rofi`
- `.editorconfig`
    - Needed
        - `editorconfig-vim`
