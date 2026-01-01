zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-up-line-or-history
bindkey -M menuselect 'k' vi-forward-char
bindkey -M menuselect 'l' vi-down-line-or-history

setopt MENU_COMPLETE

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump

zstyle ':completion:*' menu select
