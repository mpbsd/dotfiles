autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{#93A1A1}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{#A19393}●%f'
zstyle ':vcs_info:*' formats '%c%u (%F{#758080}%b%f)'

PROMPT='%F{#667070}❯%f%F{#758080}❯%f%F{#849090}❯%f '
RPROMPT='${vcs_info_msg_0_} %F{#758080}%~%f'

setopt prompt_subst
