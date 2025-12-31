autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%F{red}%u%f%F{yellow}%c%f (%F{magenta}%b%f)"

function precmd() {
  vcs_info
}

setopt prompt_subst

local SPC=' '
local NLC=$'\n'
local DIR='%F{cyan}%~%f'
local CMD='%F{red}❯%f%F{yellow}❯%f%F{green}❯%f'

PROMPT='${NLC}${CMD}${SPC}'
RPROMPT='${vcs_info_msg_0_}${SPC}${DIR}'
