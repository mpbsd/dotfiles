autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "(%F{magenta}%b%f) %F{red}%u%f%F{yellow}%c%f"
precmd() { vcs_info }

setopt PROMPT_SUBST
PROMPT='
%F{cyan}%~%f ${vcs_info_msg_0_}
$ '
