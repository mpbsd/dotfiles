autoload -Uz promptinit; promptinit

function precmd() {
  B=`git branch --show-current 2>/dev/null`
  D=`pwd`
  [[ -n "${B}" ]] && L="${D} (${B})" || L="${D}"
  R="`whoami`@`uname -n`"
  S="$(( $COLUMNS - ${#L} - 1 ))"
  N=$'\n'
  print "${N}${L}${(l:${S}:: :)R}"
}

prompt_this_prompt_is_awesome_setup() {
  PS1="> "
  RPS1="`date +%R`"
}

prompt_themes+=( this_prompt_is_awesome )

prompt this_prompt_is_awesome
