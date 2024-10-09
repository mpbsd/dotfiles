autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "(%b) %m%u%c"
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='
${PWD/#$HOME/~} ${vcs_info_msg_0_}
> '
