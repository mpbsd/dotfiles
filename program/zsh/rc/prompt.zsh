autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}●%f'
zstyle ':vcs_info:*' formats '%c%u(%F{yellow}%b%f)'

PROMPT='%F{red}❯%f%F{yellow}❯%f%F{green}❯%f '
RPROMPT='${vcs_info_msg_0_} %F{cyan}%~%f'

setopt prompt_subst
