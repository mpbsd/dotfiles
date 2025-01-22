autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "(%F{magenta}%b%f) %F{red}%u%f%F{yellow}%c%f"
precmd() { vcs_info }

setopt prompt_subst

local SPC=' '
# local NLC=$'\n'
local DIR='%F{cyan}%~%f'
local CMD='%F{red}❯%f%F{yellow}❯%f%F{green}❯%f'

PROMPT='${CMD}${SPC}'
RPROMPT='${DIR}${SPC}${vcs_info_msg_0_}'
