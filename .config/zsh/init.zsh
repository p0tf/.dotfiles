# Plugins
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,dim"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

zinit light zdharma-continuum/fast-syntax-highlighting

zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

zinit light woefe/git-prompt.zsh
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_BEHIND="-"
ZSH_THEME_GIT_PROMPT_AHEAD="+"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[yellow]%}+"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}="
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_STASH="%{$fg[cyan]%}⚑"

# zinit light momo-lab/zsh-abbrev-alias
zinit ice lucid wait="!0"
zinit light olets/zsh-abbr

# Aliases
alias ls="ls --color=auto"
alias diff="diff --color=auto"
# alias vim="nvim"
# alias d="rm -I"
# alias m="mv -i"
# alias c="cp -i"
# alias abbr="abbrev-alias"

# Variables
export EDITOR="nvim"
export MANPAGER="nvim -c Man! -"
# export PAGER="nvim -c 'set nonu' -c 'set buftype=nofile'"
export PAGER="nvimpager"
export BAT_THEME="OneHalfLight"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.deno/bin"

# Prompts
autoload -Uz colors
colors

PROMPT=''
if [ -e ~/.machine ]; then
  PROMPT+="%F{magenta}%B[$(cat ~/.machine)]%b%f "
fi
PROMPT+='%F{blue}%B%~%b%f '
PROMPT+='$(gitprompt)'
PROMPT+='%(?.%F{green}.%F{red})%B%(!.#.$)%b%f '
