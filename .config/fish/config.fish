# Clear Greeting Message
set fish_greeting

# Set default editor to nvim
set -Ux EDITOR "/usr/bin/vim"

# set default pager to vim
set -Ux MANPAGER "vim -c MANPAGER -"
set -Ux PAGER "vimpager"

# Set colors
set fish_color_normal         normal
set fish_color_autosuggestion --dim white
set fish_color_cancel         brcyan
set fish_color_command        brblue
set fish_color_comment        --dim white
set fish_color_end            --dim white
set fish_color_error          brred
set fish_color_escape         brcyan
set fish_color_match          brcyan --underline
set fish_color_operator       brpurple
set fish_color_param          normal
set fish_color_valid_path     --underline
set fish_color_quote          brgreen
set fish_color_redirection    brcyan
set fish_color_search_match   --background=brwhite
set fish_color_selection      --background=brwhite

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
