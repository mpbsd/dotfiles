prompt_git_status() {
  local INDEX STATUS

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  STATUS=""

  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^A  ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^ M ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^R  ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^ D ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi

  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^UU ' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' &> /dev/null)
  then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi

  if [[ ! -z "$STATUS" ]]
  then
    echo "$STATUS"
  fi
}

prompt_git_branch() {
  autoload -Uz vcs_info 
  precmd_vcs_info() { vcs_info }
  precmd_functions+=( precmd_vcs_info )
  setopt prompt_subst
  zstyle ':vcs_info:git:*' formats '%b'
}

prompt_git_info() {
  if [[ ! -z "$vcs_info_msg_0_" ]]
  then
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}%F{white}${vcs_info_msg_0_}%f${ZSH_THEME_GIT_PROMPT_SUFFIX}"
  fi
}

prompt_myprompt_precmd() {
  # Pass a line before each prompt
  print -P ''
}

prompt_purification_setup() {
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_myprompt_precmd

  ZSH_THEME_GIT_PROMPT_PREFIX=" %F{red}λ%f "
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  ZSH_THEME_GIT_PROMPT_ADDED="%F{green}+%f "
  ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}%f "
  ZSH_THEME_GIT_PROMPT_DELETED="%F{red}x%f "
  ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}➜%f "
  ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}═%f "
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}%f "
  ZSH_THEME_GIT_PROMPT_STASHED="%B%F{red}%f%b "
  ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{red}%f%b "
  ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{green}%f%b "

  NEWLINE=$'\n'

  prompt_git_branch
  PROMPT='%1d $(prompt_git_info) $(prompt_git_status)${NEWLINE}%n%F{red}@%f%m %F{magenta}>%f '
}

prompt_purification_setup
