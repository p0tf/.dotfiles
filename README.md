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
- `.config/nvim`
    - Needed
        - `nvim`
        - `python-pynvim`
    - Optional
        - `python-jedi`
        - `rust`
        - `rust-racer`
- `.config/alacritty.yml`
    - Needed
        - `alacritty`
- `.config/fish`
    - Needed
        - `fish`
- `.config/i3`
    - Needed
        - `i3` or `i3-gaps` or `sway`
    - Optional
        - `rofi`
        - `plasma-desktop`
- `.config/rofi`
    - Needed
        - `rofi`
