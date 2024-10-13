autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%F{red}%u%f%F{yellow}%c%f (%F{magenta}%b%f)"
precmd() { vcs_info }

function fill-line() {
  emulate -L zsh
  prompt-length $1
  local -i l_len=REPLY
  prompt-length $2 9999
  local -i r_len=REPLY
  local -i pad_len=$((COLUMNS - l_len - r_len - ${ZLE_RPROMPT_INDENT:-1}))
  if (( pad_len < 1 )); then
    # Not enough space for the right part. Drop it.
    typeset -g REPLY=$1
  else
    local pad=${(pl.$pad_len.. .)}  # pad_len spaces
    typeset -g REPLY=${1}${pad}${2}
  fi
}

# Requires: prompt_percent and no_prompt_subst.
function set-prompt() {
  emulate -L zsh
  local git_branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  git_branch=${git_branch//\%/%%}  # escape '%'

  local top_left=$'\n''%F{cyan}%~%f'
  local top_right="${vcs_info_msg_0_}"
  local bottom_left='%F{green}❯%f%F{yellow}❯%f%F{red}❯%f '
  local bottom_right='%F{yellow}%T %D%f'

  local REPLY
  fill-line "$top_left" "$top_right"
  PROMPT=$REPLY$'\n'$bottom_left
  RPROMPT=$bottom_right
}

setopt no_prompt_{bang,subst} prompt_{cr,percent,sp}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt
