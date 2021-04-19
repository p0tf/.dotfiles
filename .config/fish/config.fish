# Clear Greeting Message
set fish_greeting

# Set default editor to nvim
set -Ux EDITOR vim

# set default pager to vim
set -Ux MANPAGER "vim -c MANPAGER -"
set -Ux PAGER "vimpager"

# Set cursor mode
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set fish_user_paths ~/.local/bin
set fish_user_paths ~/.cargo/bin $fish_user_paths

fish_vi_key_bindings
